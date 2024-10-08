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
    
    //MARK: - Init
    
    weak var presenter: LoginPresenting?
    var service: LoginServicing?
    
    init(presenter: LoginPresenting, service: LoginServicing) {
        self.presenter = presenter
        self.service = service
    }
    
    //MARK: - Protocol-Method
    
    func callService(username: String, password: String) {
        service?.submitLogin(username: username, password: password, completion: { [weak self] success in
            DispatchQueue.main.async {
                self?.presenter?.presentLoginResult(success: success)  // Segundo Fluxo: LoginInteractor
            }
        })
    }
    
    func navigateToRegister() {
        presenter?.presentNavigationToRegister()  // Segundo Fluxo: LoginInteractor
    }
    
    func navigateToForgotPassword() {
        presenter?.presentNavigationToForgotPassword()  // Segundo Fluxo: LoginInteractor
    }
}
