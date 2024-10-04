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
    var coordinator: LoginCoordinating?
    
    init(view: LoginViewControllerDisplay, coordinator: LoginCoordinating?) {
        self.view = view
        self.coordinator = coordinator
    }
    
    func presentLoginResult(success: Bool) {
        if success {
            view?.showAlert(title: "Deu certo", message: "Usuario logado com sucesso")
            print("Terceiro Fluxo: LoginPresenter")

        } else {
            view?.showAlert(title: "Deu ruim", message: "Usuario não logado")
            print("Terceiro Fluxo: LoginPresenter")

        }
    }
    
    func presentNavigationToRegister() {
        print("Terceiro Fluxo: LoginPresenter")

        coordinator?.navigateToRegister()
    }
    
    func presentNavigationToForgotPassword() {
        print("Terceiro Fluxo: LoginPresenter")

        coordinator?.navigationToForgotPassword()
    }
    
    
}
