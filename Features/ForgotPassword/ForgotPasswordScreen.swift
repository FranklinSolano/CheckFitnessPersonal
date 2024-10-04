//
//  ForgotPasswordScreen.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 27/09/24.
//

import UIKit
import Modulo_DesignerSystem

class ForgotPasswordScreen: UIView {
    
   
    
    
}





import SwiftUI

// Preview para visualizar o LoginViewController
struct PreviewController_Previews1: PreviewProvider {
    static var previews: some View {
        PreviewViewControllerRepresentable1()
            .edgesIgnoringSafeArea(.all)
    }
}

// UIViewControllerRepresentable para integrar UIKit ao SwiftUI
struct PreviewViewControllerRepresentable1: UIViewControllerRepresentable {
    
    func makeUIViewController(context: Context) -> UINavigationController {
        // Cria o LoginViewController e o coloca dentro de um UINavigationController
        let previewVC = ForgotPasswordViewController()
        let navigationController = UINavigationController(rootViewController: previewVC)
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Atualizações podem ser feitas aqui, mas pode ser deixado vazio
    }
}
