//
//  MailVerificationRequiredView.swift
//  Sync Music
//
//  Created by Maxence Mottard on 14/01/2021.
//

import SwiftUI

struct MailVerificationRequiredView: View {
    @ObservedObject var viewModel: MailVerificationRequiredViewModel

    var body: some View {
        Group {
            Text("Hello, World!")
            Button("Open Email APP") {
                viewModel.handleOpenMailApp()
            }
        }
    }
}

struct MailVerificationRequiredView_Previews: PreviewProvider {
    static var previews: some View {
        ViewProvider.mailVerificationRequired()
    }
}
