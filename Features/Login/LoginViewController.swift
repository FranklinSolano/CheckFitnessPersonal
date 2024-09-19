//
//  ViewController.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 19/09/24.
//

import UIKit

class LoginViewController: UIViewController {

    
    var screen: LoginScreen?
    
    override func loadView() {
        screen = LoginScreen()
        view = screen
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

