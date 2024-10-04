//
//  RegisterInteractor.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import Foundation


protocol RegisterInteracting: AnyObject {
    func callService(username: String, email: String, password: String, confirmPassword: String)
    func navigateToLogin()
    func navigateTohome()
}

class RegisterInteractor: RegisterInteracting {
    
    weak var presenter: RegisterPreserting?
    var service: RegisterServicing?
    
    init(presenter: RegisterPreserting, service: RegisterServicing) {
        self.presenter = presenter
        self.service = service
    }
    
    func callService(username: String, email: String, password: String, confirmPassword: String) {
        service?.submitRegister(username: username, email: email, passwrod: password, confirmedPassword: confirmPassword, completion: { [weak self] success in
            DispatchQueue.main.async {
                
                self?.presenter?.presenterResultRegister(success: success)
            }
        })
    }
    
    
    func navigateToLogin() {
        self.presenter?.presenterNavigationToLogin()
    }
    
    func navigateTohome() {
        self.presenter?.presenterNavigationToHome()
    }
    
    
}

