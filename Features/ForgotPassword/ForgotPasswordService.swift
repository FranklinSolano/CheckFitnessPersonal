//
//  LoginService.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import Foundation


protocol ForgotPasswordServicing: AnyObject {
    func submitForgotPassword(email: String, completion: @escaping (Bool) -> Void)
}

class ForgotPasswordService: ForgotPasswordServicing {
    
    //MARK: - Protocol-Method
    
    func submitForgotPassword(email: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let success = !email.isEmpty
            completion(success)
        }
    }
}
