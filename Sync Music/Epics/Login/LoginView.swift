//
//  LoginView.swift
//  Sync Music
//
//  Created by Maxence Mottard on 26/12/2020.
//

import SwiftUI

struct LoginView: View {
    @ObservedObject var viewModel: LoginViewModel
    @State var registerViewIsPresented = false
    
    var body: some View {
        loginView
    }
    
    var loginView: some View {
        VStack {
            TextField("Enter your name", text: $viewModel.mail)
            Text("Hello, \(viewModel.mail)!")
            TextField("Enter your name", text: $viewModel.password)
            Text("Pass, \(viewModel.password)!")
            Button {
                viewModel.handleLogin()
            } label: {
                Text("Login")
            }
            Button("Register") {
                registerViewIsPresented = true
            }
        }.sheet(isPresented: $registerViewIsPresented) {
            ViewControllerProvider.register()
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        let vm = LoginViewModel()
        LoginView(viewModel: vm)
    }
}
