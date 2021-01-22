//
//  RegisterView.swift
//  Sync Music
//
//  Created by Maxence Mottard on 14/01/2021.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel: RegisterViewModel

    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        ViewProvider.register()
    }
}
