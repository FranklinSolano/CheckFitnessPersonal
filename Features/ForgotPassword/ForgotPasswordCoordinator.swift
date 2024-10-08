//
//  ForgotPasswordCoordinator.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import UIKit


protocol ForgotPasswordCoordinating: AnyObject {
    func navegateToForgotPassword()
}

class ForgotPasswordCoordinator: ForgotPasswordCoordinating {
    
    //MARK: - Variables
    
    weak var navegationController: UINavigationController?
    var presenter: ForgotPasswordPresenter?
    
    //MARK: - Protocol-Method
    
    func navegateToForgotPassword() {
        navegationController?.popViewController(animated: true) // Quarto FLuxo: RegisterCoordinator
    }
}
