//
//  AuthView.swift
//  FirebaseAuthSignWithApple
//
//  Created by Boris Zinovyev on 11.04.2022.
//

import SwiftUI
import FirebaseService


struct AuthView: View {

    @State var deleteConfirm = false
    
    var body: some View {
        
        
        VStack {
            
            Button() {
                self.deleteConfirm.toggle()
                } label: {
                    Label("Delete account", systemImage: "trash.fill")
            }
            .buttonStyle(.bordered)
            .controlSize(.regular)
            .foregroundColor(.red)
            .tint(.red)
        }
        .customConfirmDialog(isPresented: $deleteConfirm) {
            FirebaseSignInWithAppleButton(label: .continue) { result in
                switch result {
                case .success(let result): self.handleAppleServiceSuccess(result)
                case .failure(let err): self.handleAppleServiceError(err)
                }
            }
            .frame(maxWidth: .infinity, maxHeight: 50)
        }
    }
    func authenticate() {

    }

    func handleAppleServiceSuccess(_ result: FirebaseSignInWithAppleResult) {
        let uid = result.uid
        let firstName = result.token.appleIDCredential.fullName?.givenName ?? ""
        let lastName = result.token.appleIDCredential.fullName?.familyName ?? ""

        print(uid)
        print(firstName)
        print(lastName)

    }

    func handleAppleServiceError(_ error: Error){
        print(error.localizedDescription)
    }
}

            // *** Custom ConfirmDialog Modifier and View extension
            extension View {
                func customConfirmDialog<A: View>(isPresented: Binding<Bool>, @ViewBuilder actions: @escaping () -> A) -> some View {
                    return self.modifier(MyCustomModifier(isPresented: isPresented, actions: actions))
                }
            }

            struct MyCustomModifier<A>: ViewModifier where A: View {
                
                @Binding var isPresented: Bool
                @ViewBuilder let actions: () -> A
                
                func body(content: Content) -> some View {
                    ZStack {
                        content
                            .frame(maxWidth: .infinity, maxHeight: .infinity)
                        
                        ZStack(alignment: .bottom) {
                            if isPresented {
                                Color.primary.opacity(0.2)
                                    .ignoresSafeArea()
                                    .onTapGesture {
                                        isPresented = false
                                    }
                                    .transition(.opacity)
                            }
                            
                            if isPresented {
                                VStack {
                                    
                                    
                                    GroupBox {
                                        
                                        Text("Deleting your account will delete all content and remove your information from the database.\nYou must first re-authenticate")
                                        .multilineTextAlignment(.center)
                                            .font(.footnote)
                                            .foregroundColor(.secondary)
                                            .padding(.horizontal, 20)
                                        Divider()

                                        actions()
                                            .frame(maxWidth: .infinity, alignment: .leading)
                                    }
                                    
                                    GroupBox {
                                        Button("Cancel", role: .cancel) {
                                            isPresented = false
                                        }
                                        .bold()
                                        .frame(maxWidth: .infinity, alignment: .center)
                                    }
                                }
                                .font(.title3)
                                .padding(8)
                                .transition(.move(edge: .bottom))
                            }
                        }
                    }
                    .animation(.easeInOut, value: isPresented)
                }
            }
