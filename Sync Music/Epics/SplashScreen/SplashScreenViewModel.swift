//
//  SplashScreenViewModel.swift
//  Sync Music
//
//  Created by Maxence Mottard on 13/01/2021.
//

import Foundation
import SwiftUI

enum SplashScreenState: String {
    case loading, authenticated, unauthenticated
}

final class SplashScreenViewModel: FirebaseViewModel {
    var state: SplashScreenState = .loading {
        willSet {
            objectWillChange.send()
        }
    }
    
    func subscribeToFirebaseState() {
        firebaseService.$isAuthenticated.sink(receiveValue: weakify { strongSelf, isAuthenticated in
            guard let isAuthenticated = isAuthenticated else { return }

            strongSelf.state = isAuthenticated
                ? .authenticated
                : .unauthenticated
        }).store(in: &bag)
    }
}
