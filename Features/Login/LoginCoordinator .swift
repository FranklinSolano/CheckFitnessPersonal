//
//  LoginCoordinator .swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 02/10/24.
//

import UIKit


protocol LoginCoordinating: AnyObject {
    func navigateToRegister()
    func navigationToForgotPassword()
}

class LoginCoordinator: LoginCoordinating {
    
    //MARK: - Variables
    
    weak var navigationController: UINavigationController?
    var presenter: LoginPresenter?
    
    //MARK: - Protocol-Method
    
    func navigateToRegister() {    // Quarto Fluxo: LoginCoordinator
        guard let navigationController else { return }
        let registerFactory = RegisterFactory()
        let registerVC = registerFactory.make(navegationController: navigationController)
        navigationController.pushViewController(registerVC, animated: true)
    }
    
    func navigationToForgotPassword() {      // Quarto Fluxo: LoginCoordinator
        guard let navigationController else { return }
        let forgotPasswordFactory = ForgotPasswordFactory()
        let forgotPasswordVC = forgotPasswordFactory.make(navegationController: navigationController)
        navigationController.pushViewController(forgotPasswordVC, animated: true)
    }
}
