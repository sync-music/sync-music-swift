//
//  ViewControllerProvider+MailVerificaationRequired.swift
//  Sync Music
//
//  Created by Maxence Mottard on 14/01/2021.
//

extension ViewProvider {
    static func mailVerificationRequired() -> MailVerificationRequiredView {
        let assembly = ViewProvider.generateAssembler(viewControllerAssembly: MailVerificationRequiredAssembly())
        
        return assembly.resolver.resolve(MailVerificationRequiredView.self)!
    }
}
