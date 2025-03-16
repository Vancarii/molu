//
//  AuthViewModel.swift
//  Molu
//
//  Created by Yecheng Wang on 2025-03-13.
//


import SwiftUI
import FirebaseAuth
import FirebaseFirestore

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
        }
    }
    
    // MARK: - Check Email
    // Check if the email is already in use, by querying the Firestore database for the email
    // If the email is already in use, return an error message
    // If the email is not in use, return nil
    // Completion handler returns a Bool indicating success or failure, and an optional error message
    func checkEmail(email: String, completion: @escaping (Bool, String?) -> Void) {
        let db = Firestore.firestore()
        let usersRef = db.collection("users")

        usersRef.whereField("email", isEqualTo: email).limit(to: 1).getDocuments { querySnapshot, error in
            if let error = error {
                self.authError = error.localizedDescription
            } else if let querySnapshot = querySnapshot, !querySnapshot.isEmpty {
                self.authError = "Email is already in use."
            } else {
                completion(true, nil)
            }
        }
    }
    
    // MARK: - Check Username
    func checkUsername(username: String, completion: @escaping (Bool, String?) -> Void) {
        let db = Firestore.firestore()
        let usersRef = db.collection("users")

        usersRef.whereField("username", isEqualTo: username).limit(to: 1).getDocuments { querySnapshot, error in
            if let error = error {
                self.authError = error.localizedDescription
            } else if let querySnapshot = querySnapshot, !querySnapshot.isEmpty {
                self.authError = "Username is already in use."
            } else {
                completion(true, nil)
            }
        }
    }
    
    // MARK: - Sign Up
    // Sign up with email, password, and username
    // This is called after the email is checked, and called by the setUsername view after username is entered
    func SignUp(email: String, password: String, username: String, completion: @escaping (String?) -> Void) {
        
        checkUsername(username: username) { isAvailable, error in
            if let error = error {
                self.authError = error
            }
            
            if !isAvailable {
                self.authError = "Username is already in use."
            }
            
            Auth.auth().createUser(withEmail: email, password: password) { result, error in
                if let error = error {
                    self.authError = error.localizedDescription
                    return
                }
                
                guard let user = result?.user else {
                    completion("Failed to create user")
                    return
                }
                
                let db = Firestore.firestore()
                let userRef = db.collection("users").document(user.uid)
                
                userRef.setData([
                    "uid": user.uid,
                    "username": username,
                    "email": email
                ]) { error in
                    if let error = error {
                        self.authError = error.localizedDescription
                    } else {
                        completion(nil)
                    }
                }
            }
        }
        
    }

//    // MARK: - Sign Up
//    func signUp(email: String, password: String) {
//        authError = nil
//        Auth.auth().createUser(withEmail: email, password: password) { result, error in
//            if let error = error {
//                self.authError = error.localizedDescription
//            } else {
//                // On success, Firebase will automatically sign the user in.
//                // user object gets updated by the listener
//            }
//        }
//    }

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
