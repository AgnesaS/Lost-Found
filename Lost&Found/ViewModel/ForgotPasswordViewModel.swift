//
//  ForgotPasswordViewModel.swift
//  Lost&Found
//
//  Created by Agnesa  on 24.5.23.
//

import Foundation
import Firebase

class ForgotPasswordViewModel{
    func resetPassword(email: String, completion: @escaping (Bool, Error?) -> Void) {
        let auth = Auth.auth()
        auth.sendPasswordReset(withEmail: email) { error in
            completion(error == nil, error)
        }
    }
}
