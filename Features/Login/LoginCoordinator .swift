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
    
    weak var navigationController: UINavigationController?
    var presenter: LoginPresenter?
    
    
    
    func navigateToRegister() {
        guard let navigationController else { return }
        print("Quarto Fluxo: LoginCoordinator")
        let registerFactory = RegisterFactory()
        let registerVC = registerFactory.make(navegationController: navigationController)
        navigationController.pushViewController(registerVC, animated: true)
    }
    
    func navigationToForgotPassword() {
        
//        guard let navigationController else { return }
//       
//        let forgotPasswordFactory = ForgotPasswordFactory()
//        let forgotPasswordVC = forgotPasswordFactory.make(navigationController: navigationController)
//        navigationController.pushViewController(registerVC, animated: true)
    }
    
}

