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
    
    var body: some Scene {
        WindowGroup {
            ViewControllerProvider.splashscreen()
        }
    }
}
