//
//  LoginService.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 02/10/24.
//

import Foundation

protocol LoginServicing: AnyObject {
    func submitLogin(username: String, password: String, completion: @escaping (Bool) -> Void)
}

class LoginService: LoginServicing {
    
    //MARK: - Protocol-Method
    
    func submitLogin(username: String, password: String, completion: @escaping (Bool) -> Void) {
        // Simulação de chamada de rede. Aqui você pode integrar com APIs reais.
        DispatchQueue.global().asyncAfter(deadline: .now() + 2) {
            // Simulando sucesso se username e password não estiverem vazios
            let success = !username.isEmpty && !password.isEmpty
            completion(success)
        }
    }
}
