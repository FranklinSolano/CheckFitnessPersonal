//
//  LoginInteractor.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 02/10/24.
//

import Foundation


protocol LoginInteracting: AnyObject {
    func callService(username: String, password: String)
    func navigateToRegister()
    func navigateToForgotPassword()
}

class LoginInteractor: LoginInteracting {
    
    
    weak var presenter: LoginPresenting?
    var service: LoginServicing?
    
    init(presenter: LoginPresenting, service: LoginServicing) {
        self.presenter = presenter
        self.service = service
    }
    
    
    func callService(username: String, password: String) {
        service?.submitLogin(username: username, password: password, completion: { [weak self] success in
            DispatchQueue.main.async {
                print("Segundo Fluxo: LoginInteractor") // Debugging
                self?.presenter?.presentLoginResult(success: success)
            }
        })
    }
    
    func navigateToRegister() {
        print("Segundo Fluxo: LoginInteractor") // Debugging
        presenter?.presentNavigationToRegister()
    }
    
    func navigateToForgotPassword() {
        print("Segundo Fluxo: LoginInteractor") // Debugging
        presenter?.presentNavigationToForgotPassword()
    }

    
}
