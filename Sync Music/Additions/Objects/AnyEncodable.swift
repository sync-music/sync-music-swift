//
//  AnyEncodable.swift
//  Sync Music
//
//  Created by Maxence Mottard on 26/12/2020.
//

import Foundation

struct AnyEncodable: Encodable {

    private let encodable: Encodable

    public init(_ encodable: Encodable) {
        self.encodable = encodable
    }

    func encode(to encoder: Encoder) throws {
        try encodable.encode(to: encoder)
    }
}
