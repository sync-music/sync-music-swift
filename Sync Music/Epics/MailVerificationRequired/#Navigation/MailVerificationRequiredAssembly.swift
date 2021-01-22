//
//  MailVerificationRequiredAssembly.swift
//  Sync Music
//
//  Created by Maxence Mottard on 14/01/2021.
//

import Swinject
import SwinjectAutoregistration

final class MailVerificationRequiredAssembly: Assembly {
    func assemble(container: Container) {
        container.autoregister(MailVerificationRequiredViewModel.self, initializer: MailVerificationRequiredViewModel.init)

        container.register(MailVerificationRequiredView.self) { r -> MailVerificationRequiredView in
            let vm = r.resolve(MailVerificationRequiredViewModel.self)!

            return MailVerificationRequiredView(viewModel: vm)
        }
    }
}
