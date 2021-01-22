//
//  ViewControllerProvider+Home.swift
//  Sync Music
//
//  Created by Maxence Mottard on 14/01/2021.
//

extension ViewProvider {
    static func home() -> HomeView {
        let assembler = generateAssembler(viewControllerAssembly: HomeAssembly())
        
        return assembler.resolver.resolve(HomeView.self)!
    }
}
