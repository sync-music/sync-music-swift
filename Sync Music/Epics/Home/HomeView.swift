//
//  HomeView.swift
//  Sync Music
//
//  Created by Maxence Mottard on 14/01/2021.
//

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel

    var body: some View {
        VStack {
            Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Button("Disconnect") {
                do {
                    try viewModel.firebaseService.auth.signOut()
                } catch {
                    print("error")
                }
            }
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerProvider.home()
    }
}
