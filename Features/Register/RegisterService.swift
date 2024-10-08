//
//  RegisterService.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import Foundation

protocol RegisterServicing: AnyObject {
    func submitRegister(username: String, email: String, passwrod: String, confirmedPassword: String, completion: @escaping (Bool) -> Void)
}

class RegisterService: RegisterServicing {
    
    //MARK: - Protocol-Method
    
    func submitRegister(username: String, email: String, passwrod: String, confirmedPassword: String, completion: @escaping (Bool) -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            let success = !username.isEmpty && !email.isEmpty && !passwrod.isEmpty && !confirmedPassword.isEmpty
            completion(success)
        }
    }
    
}
