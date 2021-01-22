//
//  ViewControllerProvider.swift
//  Sync Music
//
//  Created by Maxence Mottard on 13/01/2021.
//

import Foundation
import Swinject

class ViewProvider {
    static func generateAssembler(viewControllerAssembly: Assembly) -> Assembler {
        return Assembler([viewControllerAssembly, HelperAssembly()])
    }
}
