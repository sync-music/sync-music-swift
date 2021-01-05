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

    var url: URL? { get set };
    var httpMethod: HTTPMethod { get set };
    var headers: [String: String]? { get set };
//    var dataType: WebServiceDataType { get set };
    
    func execute(_ parameters: ServiceParameters) -> AnyPublisher<DecodedType, Error>
}

extension WebService {
    private func encodeBody(parameters: ServiceParameters) throws -> Data {
        let encodable = AnyEncodable(parameters)
        return try JSONEncoder().encode(encodable)
    }
    
    func generateHeaders() -> [String: String] {
        var headersArray = headers ?? [:]
        headersArray["Content-Type"] = "application/json"
        headersArray["no-cache"] = "cache-control"
        
        return headersArray
    }
    
    func authenticatedCall(_ parameters: ServiceParameters) -> AnyPublisher<DecodedType, Error> {
        guard let idToken = UserDefaults.standard.string(forKey: "firebaseIdToken") else { return AnyPublisher.empty() }
        
        var headersArray = headers ?? [:]
        headersArray["autorization"] = "Bearer \(idToken)"
        
        return call(parameters)
    }
    
    func call(_ parameters: ServiceParameters) -> AnyPublisher<DecodedType, Error> {
        do {
            guard let url = url else { return AnyPublisher.empty() }
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
    
}
