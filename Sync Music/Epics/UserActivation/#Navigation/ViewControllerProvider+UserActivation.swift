//
//  ViewControllerProvider+UserActivation.swift
//  Sync Music
//
//  Created by Maxence Mottard on 15/01/2021.
//

extension ViewProvider {
    static func userActivation(oobCode: String) -> UserActivationView {
        let assembly = ViewProvider.generateAssembler(viewControllerAssembly: UserActivationAssembly())
        
        return assembly.resolver.resolve(UserActivationView.self, argument: oobCode)!
    }
}
