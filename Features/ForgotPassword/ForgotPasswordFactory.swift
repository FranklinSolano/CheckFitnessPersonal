//
//  ForgotPasswordFactory.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import UIKit


class ForgotPasswordFactory {
    
    func make(navegationController: UINavigationController?) -> ForgotPasswordViewController {
        let forgotPasswordVC = ForgotPasswordViewController()
        let coordinator = ForgotPasswordCoordinator()
        coordinator.navegationController = navegationController
        let presenter = ForgotPasswordPresenter(view: forgotPasswordVC, coordinator: coordinator)
        coordinator.presenter = presenter
        let service = ForgotPasswordService()
        let interactor = ForgotPasswordInteractor(presenter: presenter, service: service)
        forgotPasswordVC.interactor = interactor
        return forgotPasswordVC
    }
}
