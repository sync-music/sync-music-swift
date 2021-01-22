//
//  URL.swift
//  Sync Music
//
//  Created by Maxence Mottard on 15/01/2021.
//

import Foundation

extension URL {
    var params: [String: String] {
        var dict: [String: String] = [:]

        guard let components = URLComponents(url: self, resolvingAgainstBaseURL: false),
              let queryItems = components.queryItems else {
            return [:]
        }
        
        queryItems.forEach { item in
            dict[item.name] = item.value!
        }

        return dict
  }
}
