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
        firebaseService.currentIdToken.sink(receiveCompletion: { _ in
            return
        }, receiveValue: weakify { strongSelf, token in
            serviceSetup.service.addHeader(key: "authorization", value: "Bearer \(token)")
            strongSelf.executeRequest(serviceSetup, onSuccess: onSuccess, onError: nil)
        }).store(in: &bag)
    }
}
