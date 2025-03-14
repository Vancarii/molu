//
//  AuthViewModel.swift
//  Molu
//
//  Created by Yecheng Wang on 2025-03-13.
//


import SwiftUI
import FirebaseAuth

class AuthViewModel: ObservableObject {
    @Published var user: User?   // Firebase User object (nil if not signed in)
    @Published var authError: String?

    // Singleton pattern (optional) so you can access AuthViewModel easily
    static let shared = AuthViewModel()
    
    // Keep track of the listener so it’s not considered “unused”
    private var authListenerHandle: AuthStateDidChangeListenerHandle?


    private init() {
        // Listen for auth state changes
        authListenerHandle = Auth.auth().addStateDidChangeListener { _, user in
            self.user = user
        }
    }
    
    deinit {
        // Remove the listener if you want to stop observing when this object goes out of scope.
        if let handle = authListenerHandle {
            Auth.auth().removeStateDidChangeListener(handle)
        }    }

    // MARK: - Sign Up
    func signUp(email: String, password: String) {
        authError = nil
        Auth.auth().createUser(withEmail: email, password: password) { result, error in
            if let error = error {
                self.authError = error.localizedDescription
            } else {
                // On success, Firebase will automatically sign the user in.
                // user object gets updated by the listener
            }
        }
    }

    // MARK: - Sign In
    func signIn(email: String, password: String) {
        authError = nil
        Auth.auth().signIn(withEmail: email, password: password) { result, error in
            if let error = error {
                self.authError = error.localizedDescription
            }
            // On success, user object gets updated by the listener
        }
    }

    // MARK: - Sign Out
    func signOut() {
        do {
            try Auth.auth().signOut()
            self.user = nil
        } catch {
            self.authError = error.localizedDescription
        }
    }
}
