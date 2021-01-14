//
//  ViewControllerProvider+Register.swift
//  Sync Music
//
//  Created by Maxence Mottard on 14/01/2021.
//

import Foundation

extension ViewControllerProvider {
    static func register() -> RegisterView {
        let assembler = generateAssembler(viewControllerAssembly: RegisterAssembly())
        
        return assembler.resolver.resolve(RegisterView.self)!
    }
}
