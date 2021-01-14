//
//  SplashScreenAssembler.swift
//  Sync Music
//
//  Created by Maxence Mottard on 13/01/2021.
//

import Foundation
import Swinject

final class SplashScreenAssembly: Assembly {
    func assemble(container: Container) {
        container.register(SplashScreenViewModel.self) { r -> SplashScreenViewModel in
            let vm = SplashScreenViewModel()
            vm.firebaseService = r.resolve(FirebaseService.self)!

            return vm
        }
        
        container.register(SplashScreenView.self) { r -> SplashScreenView in
            let vm = r.resolve(SplashScreenViewModel.self)!

            return SplashScreenView(viewModel: vm)
        }
    }
}
