//
//  LoginAssembly.swift
//  Sync Music
//
//  Created by Maxence Mottard on 13/01/2021.
//

import Swinject
import SwinjectAutoregistration

final class LoginAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(LoginViewModel.self, initializer: LoginViewModel.init)
        container.register(LoginViewModel.self) { r -> LoginViewModel in
            let vm = LoginViewModel()

            vm.firebaseService = r.resolve(FirebaseService.self)!
            
            return vm
        }
        
        container.register(LoginView.self) { r -> LoginView in
            let viewModel = r.resolve(LoginViewModel.self)!
            
            return LoginView(viewModel: viewModel)
        }
    }
}
