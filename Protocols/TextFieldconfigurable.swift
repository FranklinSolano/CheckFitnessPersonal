//
//  TextFieldconfigurable.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import UIKit
import Modulo_DesignerSystem

protocol TextFieldConfigurable: AnyObject, UITextFieldDelegate {
     func configureTextField()
}

extension TextFieldConfigurable where Self: UIViewController {
    func configureTextField() {
        // A implementação padrão pode ser deixada vazia
    }
    
     func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() // Esconde o teclado
        return true
    }
}
