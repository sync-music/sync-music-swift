//
//  SplashScreenView.swift
//  Sync Music
//
//  Created by Maxence Mottard on 13/01/2021.
//

import SwiftUI

struct SplashScreenView: View {
    @ObservedObject var viewModel: SplashScreenViewModel
    
    var body: some View {
        Group {
            if viewModel.state == .loading {
                loadingView
            } else if viewModel.state == .unauthenticated {
                ViewProvider.login()
            } else {
                ViewProvider.home()
            }
        }.onAppear(perform: {
            viewModel.subscribeToFirebaseState()
        })
    }
    
    var loadingView: some View {
        Group {
            Text("Loading")
            Text(viewModel.state.rawValue)
        }
    }
}

struct SplashScreenView_Previews: PreviewProvider {
    static var previews: some View {
        ViewProvider.splashscreen()
    }
}
