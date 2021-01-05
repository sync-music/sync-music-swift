//
//  RegisterService.swift
//  Sync Music
//
//  Created by Maxence Mottard on 26/12/2020.
//

import Foundation
import Combine
import FirebaseAuth

struct RegisterWebServiceParameters: Encodable {}
struct RegisterWebServiceResponse: Decodable {}

final class RegisterWebService: WebService {
    typealias DecodedType = RegisterWebServiceResponse
    typealias ServiceParameters = RegisterWebServiceParameters
    
    var url: URL? = URL(string: "https://api.syncmusic.maxencemottard.com/api/register")
    
    var httpMethod: HTTPMethod = .POST
    
    var headers: [String : String]? = [:]
    
    func execute(_ parameters: ServiceParameters) -> AnyPublisher<DecodedType, Error> {
        return call(parameters)
    }
}
