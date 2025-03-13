//
//  MoluApp.swift
//  Molu
//
//  Created by Yecheng Wang on 2024-07-16.
//

import SwiftUI
import FirebaseCore

// Firebase Authentication
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()
    return true
  }
}

@main
struct MoluApp: App {

    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
