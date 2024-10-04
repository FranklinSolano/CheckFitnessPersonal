//
//  RegisterCoordinator.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import UIKit


protocol RegisterCoordinating: AnyObject {
    func navigateToLogin()
    func navigateToHome()
}

class RegisterCoordinator: RegisterCoordinating {
    
    weak var navegationController: UINavigationController?
    var presenter: RegisterPresenter?
    
    
    func navigateToLogin() {
        navegationController?.popViewController(animated: true)
    }
        
    func navigateToHome() {
        
    }
    
        
}
