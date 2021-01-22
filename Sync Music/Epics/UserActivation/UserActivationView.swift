//
//  UserActivationView.swift
//  Sync Music
//
//  Created by Maxence Mottard on 15/01/2021.
//

import SwiftUI

struct UserActivationView: View {
    @ObservedObject var viewModel: UserActivationViewModel

    var body: some View {
        Group {
            Text("Activation \(viewModel.oobCode)")
            Button("Activer mon compte") {
                viewModel.hanleActivation()
            }
        }
    }
}

struct UserActivationView_Previews: PreviewProvider {
    static var previews: some View {
        ViewProvider.userActivation(oobCode: "test")
    }
}
