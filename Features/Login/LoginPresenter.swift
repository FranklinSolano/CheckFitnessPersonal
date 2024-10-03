//
//  LoginPresenter.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 02/10/24.
//

import Foundation


protocol LoginPresenting: AnyObject {
    func presentLoginResult(success: Bool)
    func presentNavigationToRegister()
    func presentNavigationToForgotPassword()
}

class LoginPresenter: LoginPresenting {
    
    weak var view: LoginViewControllerDisplay?
    var coordinator: LoginCoordinator?
    
    init(view: LoginViewControllerDisplay, coordinator: LoginCoordinator) {
        self.view = view
        self.coordinator = coordinator
    }
    
    func presentLoginResult(success: Bool) {
        if success {
            view?.showAlert(title: "Deu certo", message: "Usuario logado com sucesso")
        } else {
            view?.showAlert(title: "Deu ruim", message: "Usuario não logado")
        }
    }
    
    func presentNavigationToRegister() {
        coordinator?.navigateToRegister()
    }
    
    func presentNavigationToForgotPassword() {
        coordinator?.navigationToForgotPassword()
    }
    
    
}
