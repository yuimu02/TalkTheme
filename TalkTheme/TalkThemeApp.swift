//
//  TalkThemeApp.swift
//  TalkTheme
//
//  Created by Yuiko Muroyama on 2025/01/29.
//
import Firebase
import SwiftUI

@main
struct TalkThemeApp: App {
    
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
             HomeView()
        }
    }
}
class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
            FirebaseApp.configure()
        return true
    }
}
