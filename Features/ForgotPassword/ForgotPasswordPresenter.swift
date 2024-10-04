//
//  LoginPresenter.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import Foundation

protocol ForgotPasswordPresenting: AnyObject {
    func presenterForgotPasswordResult(success: Bool)
    func presentNavegationToLogin()
}

class ForgotPasswordPresenter: ForgotPasswordPresenting {
    
    weak var view: ForgotPasswordViewControllerDisplay?
    var coordinator: ForgotPasswordCoordinating?
    
    init(view: ForgotPasswordViewControllerDisplay, coordinator: ForgotPasswordCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
    
    
    
    func presenterForgotPasswordResult(success: Bool) {
        if success {
            self.view?.showAlert(title: "Sucesso", message: "Email enviado para redefinar a senha com sucesso!")
        } else {
            self.view?.showAlert(title: "Erro", message: "Preencha todos os campos!")
        }
    }
    
    func presentNavegationToLogin() {
        coordinator?.navegateToForgotPassword()
    }
    
    
}
