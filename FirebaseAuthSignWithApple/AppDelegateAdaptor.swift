//
//  AppDelegateAdaptor.swift
//  FirebaseAuthSignWithApple
//
//  Created by Boris Zinovyev on 11.04.2022.
//

import SwiftUI
import Firebase

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        
        FirebaseApp.configure()
        return true
    }
}
