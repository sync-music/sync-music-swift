//
//  RegisterViewModel.swift
//  Sync Music
//
//  Created by Maxence Mottard on 13/01/2021.
//

import Foundation
import FirebaseAuth

final class RegisterViewModel: FirebaseViewModel {
    @Published var mail: String = ""
    @Published var password: String = ""
    @Published var confirmPassword: String = ""

    var registerService: RegisterWebService!

    func handleRegister() {
//        Check values

        firebaseService.auth.createUser(withEmail: mail, password: password, completion: weakify { (strongSelf, result, error) in
            strongSelf.executeRequestWithAuthorization(ExecuteServiceSetup(
                service: strongSelf.registerService,
                parameters: .init()
            )) { result in
                print("email envoyé")
                print(result)
            }
        })
    }
}
