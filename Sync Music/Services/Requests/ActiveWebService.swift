//
//  ActiveWebService.swift
//  Sync Music
//
//  Created by Maxence Mottard on 15/01/2021.
//

import Foundation

struct ActiveWebServiceParameters: Encodable {
    let oobCode: String
}

final class ActiveWebService: WebService {
    typealias DecodedType = EmptyResponse
    typealias ServiceParameters = ActiveWebServiceParameters
    
    var url: String = "https://api.syncmusic.maxencemottard.com/api/user/active"

    var httpMethod: HTTPMethod = .POST
    
    var headers: [String : String] = [:]
}


struct RegisterWebServiceParameters: Encodable {
    let oobCode: String
}
