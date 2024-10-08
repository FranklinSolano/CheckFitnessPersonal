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
    
    //MARK: - Variables
    
    weak var navegationController: UINavigationController?
    var presenter: RegisterPresenter?
    
    //MARK: - Protocol-Method
    
    func navigateToLogin() {
        navegationController?.popViewController(animated: true) // Quarto FLuxo: RegisterCoordinator
    }
        
    func navigateToHome() {  // Quarto FLuxo: RegisterCoordinator
    }
}
