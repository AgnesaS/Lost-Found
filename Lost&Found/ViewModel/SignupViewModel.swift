//
//  SignupViewModel.swift
//  Lost&Found
//
//  Created by Agnesa  on 24.5.23.
//

import Foundation
import Firebase

class SignupViewModel{
    func signUp(firstName: String, lastName: String, email: String, phoneNumber: String, password: String, completion: @escaping (Error?) -> Void) {
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            completion(error)
        }
    }
}
