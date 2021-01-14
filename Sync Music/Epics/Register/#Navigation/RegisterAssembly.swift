//
//  RegisterAssembly.swift
//  Sync Music
//
//  Created by Maxence Mottard on 14/01/2021.
//

import Swinject
import SwinjectAutoregistration

final class RegisterAssembly: Assembly {
    func assemble(container: Container) {
        container.register(RegisterViewModel.self) { r -> RegisterViewModel in
            let vm = RegisterViewModel()
            
            vm.registerService = r.resolve(RegisterWebService.self)!
            vm.firebaseService = r.resolve(FirebaseService.self)!
            
            return vm
        }
        
        container.register(RegisterView.self) { r -> RegisterView in
            let viewModel = r.resolve(RegisterViewModel.self)!
            
            return RegisterView(viewModel: viewModel)
        }
    }
}
