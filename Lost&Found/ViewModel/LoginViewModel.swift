//
//  LoginViewModel.swift
//  Lost&Found
//
//  Created by Agnesa  on 24.5.23.
//

import Foundation
import Firebase

class LoginViewModel{
    func signIn(email: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            completion(error)
        }
    }
    func sendVerificationEmail(email: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().currentUser?.sendEmailVerification(completion: { error in
            completion(error)
        })
    }
}

