//
//  BaseView.swift
//  Sync Music
//
//  Created by Maxence Mottard on 22/01/2021.
//

import SwiftUI

protocol BaseView: View {
    associatedtype Content: View;
    associatedtype VM: ViewModel;

    var viewModel: VM { get set }
    @ViewBuilder var content: Self.Content { get }
}

extension BaseView {
    var body: some View {
        content
            .alert(isPresented: viewModel.$errorAlertIsShown, content: {
                Alert(
                    title: Text("Vous n'êtes pas connecté"),
                    primaryButton: Alert.Button.default(Text("Se ®connecter")) {
                        viewModel.errorAlertIsShown = false
                    }, secondaryButton: .cancel())
            })
    }
}
