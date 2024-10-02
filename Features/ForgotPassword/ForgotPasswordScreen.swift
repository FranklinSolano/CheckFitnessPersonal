//
//  ForgotPasswordScreen.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 27/09/24.
//

import UIKit
import Modulo_DesignerSystem

class ForgotPasswordScreen: UIView {
    
    lazy var BackButton: UIButton = {
        let button = CustomButton(title: "Voltar", fontSize: 14)
        return button
    }()
    
    lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Esqueceu a senha", font: UIFont.systemFont(ofSize: 24, weight: .bold), textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var subtitleLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Insire o seu email aqui, para poder redefinar a senha", font: UIFont.systemFont(ofSize: 14, weight: .medium), textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var emailTextField: UITextField = {
        let textfield = CustomTextField(placeholder: "Digite seu email", image: UIImage(systemName: "person")!)
        textfield.configureTextField(isSecure: false, keyboardType: .emailAddress, autocapitalization: .none, placeholderColor: .darkGray)
        return textfield
    }()
    
    lazy var enterButton: UIButton = {
        let button = CustomButton(title: "Enviar")
        return button
    }()

    override init(frame: CGRect) {
        super.init(frame: frame)
        configSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSetup() {
        backgroundColor = DesignerSystem.Colors.primaryColor
        configElement()
        configConstraints()
    }
    
    private func configElement() {
        addSubview(BackButton)
        addSubview(titleLabel)
        addSubview(subtitleLabel)
        addSubview(emailTextField)
        addSubview(enterButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            BackButton.topAnchor.constraint(equalTo: topAnchor,constant: 50),
            BackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            titleLabel.topAnchor.constraint(equalTo: BackButton.bottomAnchor, constant: 120),
            titleLabel.leadingAnchor.constraint(equalTo: BackButton.leadingAnchor),
            
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            subtitleLabel.leadingAnchor.constraint(equalTo: BackButton.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor,constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo:trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            enterButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -40),
            enterButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            enterButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            enterButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    
    
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
