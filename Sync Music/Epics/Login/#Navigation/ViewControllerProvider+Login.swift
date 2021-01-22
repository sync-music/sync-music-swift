//
//  LoginProvider.swift
//  Sync Music
//
//  Created by Maxence Mottard on 13/01/2021.
//

import Foundation
import Swinject

extension ViewProvider {
    static func login() -> LoginView {
        let assembler = generateAssembler(viewControllerAssembly: LoginAssembly())
        
        return assembler.resolver.resolve(LoginView.self)!
    }
}
