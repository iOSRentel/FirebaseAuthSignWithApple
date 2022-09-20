//
//  FirebaseAuthSignWithAppleApp.swift
//  FirebaseAuthSignWithApple
//
//  Created by Boris Zinovyev on 11.04.2022.
//https://www.youtube.com/watch?v=hwbHQf1Mvxk&t=1014s

import SwiftUI
import FirebaseService

@main
struct FirebaseAuthSignWithAppleApp: App {
    
@UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
@StateObject private var authState = AuthState()
    
    var body: some Scene {
        WindowGroup {
            switch authState.value {
            case .undefined:
                ProgressView()
            case .authenticated:
                NavigationView {
                    ContentView()
                }
            case .notAuthenticated:
                AuthView()
            }
        }
    }
}
