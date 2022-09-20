//
//  ContentView.swift
//  FirebaseAuthSignWithApple
//
//  Created by Boris Zinovyev on 11.04.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var viewModel = ViewModel()
    
    var body: some View {
        Button {
            Task {
                do {
                    try await viewModel.logout()
                } catch {
                    print(error.localizedDescription)
                }
            }
        } label: {
            Text("LogOut")
        }
        .buttonStyle(.borderedProminent)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
