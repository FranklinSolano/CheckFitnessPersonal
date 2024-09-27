//
//  RegisterViewController.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 24/09/24.
//

import UIKit

class RegisterViewController: UIViewController {
    
    var screen: RegisterScreen?
    
    override func loadView() {
        screen = RegisterScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

}
