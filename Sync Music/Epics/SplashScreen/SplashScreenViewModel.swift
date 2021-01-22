//
//  SplashScreenViewModel.swift
//  Sync Music
//
//  Created by Maxence Mottard on 13/01/2021.
//

import Foundation
import SwiftUI

enum SplashScreenState: String {
    case loading, authenticated, unauthenticated, inactiveAccount
}

final class SplashScreenViewModel: FirebaseViewModel {
    var state: SplashScreenState = .loading {
        willSet {
            objectWillChange.send()
        }
    }
    
    func subscribeToFirebaseState() {
        firebaseService.$isAuthenticated.sink(receiveValue: weakify { strongSelf, isAuthenticated in
            guard let isAuthenticated = isAuthenticated,
                let user = strongSelf.firebaseService.user else { return }
            
            if !isAuthenticated || isAuthenticated && !user.isEmailVerified{
                strongSelf.state = .unauthenticated
            } else if isAuthenticated {
                strongSelf.state = .authenticated
            }
        }).store(in: &bag)
    }
}
