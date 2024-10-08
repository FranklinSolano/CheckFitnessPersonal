//
//  RegisterFactory.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//


import UIKit


class RegisterFactory {
    
    func make(navegationController: UINavigationController) -> RegisterViewController {
        
        let registerVC = RegisterViewController()
        let coordinator = RegisterCoordinator()
        coordinator.navegationController = navegationController
        let presenter = RegisterPresenter(view: registerVC, coordinator: coordinator)
        coordinator.presenter = presenter
        let service = RegisterService()
        let interactor = RegisterInteractor(presenter: presenter, service: service)
        registerVC.interactor = interactor
        return registerVC
    }
}
