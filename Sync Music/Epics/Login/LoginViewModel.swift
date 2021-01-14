//
//  LoginViewModel.swift
//  Sync Music
//
//  Created by Maxence Mottard on 26/12/2020.
//

import Foundation
import SwiftUI
import FirebaseAuth
import Combine

final class LoginViewModel: FirebaseViewModel {
    @Published var mail: String = ""
    @Published var password: String = ""
    
    func handleLogin() {
        firebaseService.auth.signIn(withEmail: mail, password: password) { (authResult, error) in
            if let error = error {
                print(error)

                return
            }
            
            guard let result = authResult else {
                print("unknown error")

                return
            }

            print(result)
        }
    }
}
