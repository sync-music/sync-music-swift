//
//  FirebaseService.swift
//  Sync Music
//
//  Created by Maxence Mottard on 27/12/2020.
//

import Foundation
import FirebaseAuth
import Combine
import SwiftUI

final class FirebaseService: ObservableObject, Weakable {
    @AppStorage("firebaseIdToken") var firebaseIdToken: String = ""
    @State private var bag = Set<AnyCancellable>()
    @Published var isAuthenticated: Bool?
    var currentIdToken: String?

    var auth: Auth {
        return Auth.auth()
    }
    
    init() {
        auth.addStateDidChangeListener(onFirebaseStateChange(auth:user:))
    }
    
    func onFirebaseStateChange(auth: Auth, user: User?) {
        guard let user = user else {
            isAuthenticated = false
            currentIdToken = nil

            return
        }

        user.getIDToken(completion: { [weak self] (idToken, error) in
            guard let strongSelf = self,
                  let idToken = idToken else { return }
            
            strongSelf.currentIdToken = idToken
            strongSelf.isAuthenticated = true
         })
    }
}
