//
//  LoginInteractor.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import Foundation
 
protocol ForgotPasswordInteracting: AnyObject {
    func callService(email: String)
    func navegationToLogin()
}

class ForgotPasswordInteractor: ForgotPasswordInteracting {
    

    weak var presenter: ForgotPasswordPresenting?
    var service: ForgotPasswordServicing?
    
    init(presenter: ForgotPasswordPresenting, service: ForgotPasswordServicing) {
        self.presenter = presenter
        self.service = service
    }
    
    
    func callService(email: String) {
        service?.submitForgotPassword(email: email, completion: { [weak self] successs in
            DispatchQueue.main.async {
                self?.presenter?.presenterForgotPasswordResult(success: successs)
            }
        })
    }
    
    
    func navegationToLogin() {
        presenter?.presentNavegationToLogin()
    }
    
}
