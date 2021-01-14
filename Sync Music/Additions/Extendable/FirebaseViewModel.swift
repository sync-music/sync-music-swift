//
//  FirebaseViewModel.swift
//  Sync Music
//
//  Created by Maxence Mottard on 13/01/2021.
//

import Foundation

class FirebaseViewModel: ViewModel {
    var firebaseService: FirebaseService!

    func executeRequestWithAuthorization<T: WebService>(_ serviceSetup: ExecuteServiceSetup<T>, onSuccess: @escaping ((T.DecodedType) -> Void)) {
        guard let token = firebaseService.currentIdToken else { return }
        
        serviceSetup.service.addHeader(key: "authorization", value: "Bearer \(token)")
        executeRequest(serviceSetup, onSuccess: onSuccess, onError: nil)
    }
}
