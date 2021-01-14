//
//  HomeAssembly.swift
//  Sync Music
//
//  Created by Maxence Mottard on 14/01/2021.
//

import Swinject
import SwinjectAutoregistration

final class HomeAssembly: Assembly {
    func assemble(container: Container) {
        container.register(HomeViewModel.self) { r -> HomeViewModel in
            let vm = HomeViewModel()
            vm.firebaseService = r.resolve(FirebaseService.self)!
            
            return vm
        }
        
        container.register(HomeView.self) { r -> HomeView in
            let vm = r.resolve(HomeViewModel.self)!

            return HomeView(viewModel: vm)
        }
    }
}
