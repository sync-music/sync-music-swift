//
//  Request.swift
//  FYD
//
//  Created by Maxence Mottard on 30/10/2020.
//  Copyright © 2020 Maxence Mottard. All rights reserved.
//

import Foundation
import Combine

enum HTTPMethod: String {
    case POST = "POST"
    case GET = "GET"
    case PUT = "PUT"
    case DELETE = "DELETE"
}

enum WebServiceDataType {
    case JSON
}

protocol WebService: Weakable {
    associatedtype DecodedType: Decodable
    associatedtype ServiceParameters: Encodable;

    var url: String { get set };
    var httpMethod: HTTPMethod { get set };
    var headers: [String: String] { get set };
}

extension WebService {
    private func encodeBody(parameters: ServiceParameters) throws -> Data {
        let encodable = AnyEncodable(parameters)
        return try JSONEncoder().encode(encodable)
    }
    
    func generateHeaders() -> [String: String] {
        headers["content-type"] = "application/json"
        headers["no-cache"] = "cache-control"
        
        return headers
    }
    
    func call(_ parameters: ServiceParameters, urlParameters: [String]) -> AnyPublisher<DecodedType, Error> {
        do {
            let urlString = String(format: url, arguments: urlParameters)
            guard let url = URL(string: urlString) else { return AnyPublisher.empty() }

            var request = URLRequest(url: url)
            request.httpMethod = httpMethod.rawValue
            request.httpBody = try encodeBody(parameters: parameters)
            
            for (key, value) in generateHeaders() {
                request.addValue(value, forHTTPHeaderField: key)
            }
            
            return URLSession.shared.dataTaskPublisher(for: request)
                .map { $0.data }
                .decode(type: DecodedType.self, decoder: JSONDecoder())
                .eraseToAnyPublisher()
        } catch let error {
            return AnyPublisher(Fail(error: error))
        }
    }
    
    func addHeader(key: String, value: String) {
        headers[key] = value
    }
}
