//
//  Sync_MusicApp.swift
//  Sync Music
//
//  Created by Maxence Mottard on 26/12/2020.
//

import SwiftUI
import Firebase
import Combine

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()

        return true
    }
}

@main
struct Sync_MusicApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
    @State var openUrlData: [String: String]?
    
    var body: some Scene {
        WindowGroup {
            Group {
                if let data = openUrlData, data["mode"] == "verifyEmail", let oobCode = data["oobCode"] {
                    ViewProvider.userActivation(oobCode: oobCode)
                } else {
                    ViewProvider.splashscreen()
                }
            }.onOpenURL(perform: handleOnOpenURL(url:))
        }
    }

    private func handleOnOpenURL(url: URL) {
        if url.path == "/api/firebase/actions" {
            openUrlData = url.params
        }
    }
}
