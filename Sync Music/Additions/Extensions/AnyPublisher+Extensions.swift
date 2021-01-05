//
//  AnyPublisher+Extensions.swift
//  Sync Music
//
//  Created by Maxence Mottard on 26/12/2020.
//

import Combine

extension AnyPublisher {
    
    static func empty() -> AnyPublisher {
        return AnyPublisher(Empty())
    }
    
}
