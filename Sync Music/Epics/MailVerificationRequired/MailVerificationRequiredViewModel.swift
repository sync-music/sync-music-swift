//
//  MailVerificationRequiredViewModel.swift
//  Sync Music
//
//  Created by Maxence Mottard on 14/01/2021.
//

import Foundation
import UIKit

final class MailVerificationRequiredViewModel: ViewModel {
    func handleOpenMailApp() {
        guard let mailURL = URL(string: "googlegmail://"),
              UIApplication.shared.canOpenURL(mailURL) else {
            return
        }

        UIApplication.shared.open(mailURL, options: [:], completionHandler: nil)
    }
}
