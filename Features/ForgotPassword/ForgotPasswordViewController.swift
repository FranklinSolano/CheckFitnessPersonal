//
//  ForgotPasswordViewController.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 27/09/24.
//

import UIKit

class ForgotPasswordViewController: UIViewController {
    
    var screen: ForgotPasswordScreen?
    
    override func loadView() {
        screen = ForgotPasswordScreen()
        view = screen
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
}
