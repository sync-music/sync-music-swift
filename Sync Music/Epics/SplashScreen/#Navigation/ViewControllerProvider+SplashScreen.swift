//
//  ViewControllerProvider+SplashScreen.swift
//  Sync Music
//
//  Created by Maxence Mottard on 13/01/2021.
//

extension ViewProvider {
    static func splashscreen() -> SplashScreenView {
        let assembler = generateAssembler(viewControllerAssembly: SplashScreenAssembly())
        
        return assembler.resolver.resolve(SplashScreenView.self)!
    }
}
