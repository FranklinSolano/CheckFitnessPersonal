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
    
    //MARK: - Init
    
    weak var presenter: RegisterPreserting?
    var service: RegisterServicing?
    
    init(presenter: RegisterPreserting, service: RegisterServicing) {
        self.presenter = presenter
        self.service = service
    }
    
    //MARK: - Protocol-Method
    
    func callService(username: String, email: String, password: String, confirmPassword: String) {
        service?.submitRegister(username: username, email: email, passwrod: password, confirmedPassword: confirmPassword, completion: { [weak self] success in
            DispatchQueue.main.async {
                self?.presenter?.presenterResultRegister(success: success) //Segundo Fluxo: RegisterInteractor
            }
        })
    }
    
    func navigateToLogin() {
        self.presenter?.presenterNavigationToLogin()  //Segundo Fluxo: RegisterInteractor
    }
    
    func navigateTohome() {
        self.presenter?.presenterNavigationToHome() //Segundo Fluxo: RegisterInteractor
    }
}

