//
//  UserActivationAssembly.swift
//  Sync Music
//
//  Created by Maxence Mottard on 15/01/2021.
//

import Swinject

final class UserActivationAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(ActiveWebService.self, initializer: ActiveWebService.init)

        container.register(UserActivationViewModel.self) { (r: Resolver, oobCode: String) -> UserActivationViewModel in
            let vm = UserActivationViewModel()
            vm.activationService = r.resolve(ActiveWebService.self)!
            vm.oobCode = oobCode
            
            return vm
        }

        container.register(UserActivationView.self) { (r: Resolver, oobCode: String) -> UserActivationView in
            let vm = r.resolve(UserActivationViewModel.self, argument: oobCode)!

            return UserActivationView(viewModel: vm)
        }
    }
}
