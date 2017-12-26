//
//  AuthProvider.swift
//  Scheddit
//
//  Created by Michael V. Corpus on 26/12/2017.
//  Copyright © 2017 Michael V. Corpus. All rights reserved.
//

import Foundation
import FirebaseAuth

typealias LoginHandler = (_ msg: String?) -> Void

struct  LoginErrorCode {
    static let INVALID_EMAIL = "Invalid Email Address, Please Provide A Real Email Address"
    static let WRONG_PASSWORD = "Wrong Password, Please Enter The Correct Password"
    static let PROBLEM_CONNECTING = "Problem Connecting To Database, Please Try Later"
    static let USER_NOT_FOUND = "User Not Found, Please Register"
    static let EMAIL_ALREADY_IN_USE = "Email Already In Use, Please User Another Email"
    static let WEAK_PASSWORD = "Password Should Be At Least 6 Characters Long"
}

class AuthProvider {
    private static let _instance = AuthProvider()
    
    static var Instance: AuthProvider {
        return _instance
    }
    
    func login(withEmail: String, password: String, loginHandler:LoginHandler?) {
        Auth.auth().signIn(withEmail: withEmail, password: password, completion: { (user, error) in
            
            if error != nil {
                self.handleErrors(err: error! as NSError, loginHandler: loginHandler)
            } else {
                loginHandler?(nil)
            }
            
            
        })
    }
    
    private func handleErrors(err: NSError, loginHandler: LoginHandler?) {
        
        if let errCode = AuthErrorCode(rawValue: err.code) {
            
            switch errCode {
            case .wrongPassword:
                loginHandler?(LoginErrorCode.WRONG_PASSWORD)
                break
            case .invalidEmail:
                loginHandler?(LoginErrorCode.INVALID_EMAIL)
                break
            case .userNotFound:
                loginHandler?(LoginErrorCode.USER_NOT_FOUND)
                break
            case .emailAlreadyInUse:
                loginHandler?(LoginErrorCode.EMAIL_ALREADY_IN_USE)
                break
            case .weakPassword:
                loginHandler?(LoginErrorCode.WEAK_PASSWORD)
                break
            default:
                loginHandler?(LoginErrorCode.PROBLEM_CONNECTING)
                break
                
                
            }
        }
    }
    
} //class


