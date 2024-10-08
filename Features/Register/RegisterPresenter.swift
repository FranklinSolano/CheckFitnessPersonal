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
    
    //MARK: - Init
    
    weak var view: RegisterViewControllerDisplay?
    var coordinator: RegisterCoordinating?
    
    init(view: RegisterViewControllerDisplay, coordinator: RegisterCoordinating) {
        self.view = view
        self.coordinator = coordinator
    }
    
    //MARK: - Protocol-Method
    
    func presenterResultRegister(success: Bool) {
        if success {
            view?.showAlert(title: "Sucesso", message: "Cadastro feito com sucesso!") //Terceiro Fluxo: RegisterPresenter
        } else {
            view?.showAlert(title: "Error", message: "Preencha todos os campos!") //Terceiro Fluxo: RegisterPresenter
        }
    }
    
    func presenterNavigationToLogin() {
        coordinator?.navigateToLogin() //Terceiro Fluxo: RegisterPresenter
    }
    
    func presenterNavigationToHome() {
        coordinator?.navigateToHome() //Terceiro Fluxo: RegisterPresenter
    }
}
