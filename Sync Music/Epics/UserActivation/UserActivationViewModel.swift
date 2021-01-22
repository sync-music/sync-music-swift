//
//  UserActivationViewModel.swift
//  Sync Music
//
//  Created by Maxence Mottard on 15/01/2021.
//

import Foundation

final class UserActivationViewModel: ViewModel {
    var activationService: ActiveWebService!
    var oobCode: String!

    func hanleActivation() {
        let setup = ExecuteServiceSetup(service: activationService, parameters: .init(oobCode: oobCode))

        executeRequestWithoutDecode(setup) {
            print("GG")
        }
    }
}
