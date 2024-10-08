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
    
    //MARK: - Init
    
    weak var view: LoginViewControllerDisplay?
    var coordinator: LoginCoordinating?
    
    init(view: LoginViewControllerDisplay, coordinator: LoginCoordinating?) {
        self.view = view
        self.coordinator = coordinator
    }
    
    //MARK: - Protocol-Method
    
    func   presentLoginResult(success: Bool) {
        if success {
            view?.showAlert(title: "Deu certo", message: "Usuario logado com sucesso")   //Terceiro Fluxo: LoginPresenter
        } else {
            view?.showAlert(title: "Deu ruim", message: "Usuario não logado")  //Terceiro Fluxo: LoginPresenter
        }
    }
    
    func presentNavigationToRegister() {
        coordinator?.navigateToRegister()       //Terceiro Fluxo: LoginPresenter
    }
    
    func presentNavigationToForgotPassword() {
        coordinator?.navigationToForgotPassword()     //Terceiro Fluxo: LoginPresenter
    }
}
