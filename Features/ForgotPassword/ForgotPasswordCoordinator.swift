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
    
    weak var navegationController: UINavigationController?
    var presenter: ForgotPasswordPresenter?
    
    func navegateToForgotPassword() {
        navegationController?.popViewController(animated: true)
    }
    
    
}
