//
//  LoginFactory.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 02/10/24.
//

import UIKit

class LoginFactory {
    
    func make(navigationController: UINavigationController) -> (viewController: LoginViewController, coordinator: LoginCoordinator) {
        
        let loginVC = LoginViewController()
        let coordinator = LoginCoordinator()
        coordinator.navigationController = navigationController
        let presenter = LoginPresenter(view: loginVC, coordinator: coordinator)
        coordinator.presenter = presenter
        let service = LoginService()
        let interactor = LoginInteractor(presenter: presenter, service: service)
        
        loginVC.interactor = interactor
        
        return (loginVC, coordinator)
        
    }
    
}


