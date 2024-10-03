//
//  LoginInteractor.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 02/10/24.
//

import Foundation


protocol LoginInteracting: AnyObject {
    func login(username: String, password: String)
    func navigateToRegister()
    func navigateToForgotPassword()
}

class LoginInteractor: LoginInteracting {
    
    
    weak var presenter: LoginPresenting?
    var service: LoginServicing?
    
    init(presenter: LoginPresenter, service: LoginService) {
        self.presenter = presenter
        self.service = service
    }
    
    
    func login(username: String, password: String) {
        service?.submitLogin(username: username, password: password, completion: { [weak self] success in
            self?.presenter?.presentLoginResult(success: success)
        })
    }
    
    func navigateToRegister() {
        presenter?.presentNavigationToRegister()
    }
    
    func navigateToForgotPassword() {
        presenter?.presentNavigationToForgotPassword()
    }

    
}
