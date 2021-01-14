//
//  HelperAssembly.swift
//  Sync Music
//
//  Created by Maxence Mottard on 13/01/2021.
//

import Swinject
import SwinjectAutoregistration

class HelperAssembly: Assembly {
    func assemble(container: Container) {
        registerServices(container)
        registerWebServices(container)
    }
    
    func registerServices(_ container: Container) {
        container.autoregister(FirebaseService.self, initializer: FirebaseService.init)
    }
    
    func registerWebServices(_ container: Container) {
        container.autoregister(RegisterWebService.self, initializer: RegisterWebService.init)
    }
}
