//
//  ContentViewModel.swift
//  FirebaseAuthSignWithApple
//
//  Created by Boris Zinovyev on 11.04.2022.
//

import SwiftUI
import Combine
import FirebaseService

extension ContentView {
    
    class ViewModel: ObservableObject {
        
        var cancellables: Set<AnyCancellable> = []
        
        func logout() async throws {
            let promise = AuthService.logout()
            try await AsyncPromise.fulfill(promise, storeIn: &cancellables)
        }
    }
}
