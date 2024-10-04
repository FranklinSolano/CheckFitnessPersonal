//
//  RegisterPresenter.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import Foundation


protocol RegisterPreserting: AnyObject {
    func presenterResultRegister(success: Bool)
    func presenterNavigationToLogin()
    func presenterNavigationToHome()
    
}

class RegisterPresenter: RegisterPreserting {
    
    
    weak var view: RegisterViewControllerDisplay?
    var coordinator: RegisterCoordinating?
    
    init(view: RegisterViewControllerDisplay, coordinator: RegisterCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
    
    
    func presenterResultRegister(success: Bool) {
        if success {
            view?.showAlert(title: "Sucesso", message: "Cadastro feito com sucesso!")
            coordinator?.navigateToLogin()
        } else {
            view?.showAlert(title: "Error", message: "Preencha todos os campos!")
        }
    }
    
    func presenterNavigationToLogin() {
        coordinator?.navigateToLogin()
    }
    
    func presenterNavigationToHome() {
        coordinator?.navigateToHome()
    }

}
