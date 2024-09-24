//
//  LoginScreen.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 19/09/24.
//

import UIKit
import Modulo_DesignerSystem

class LoginScreen: UIView {
    
    lazy var logoCheckFitnee: UIView = {
        let view = CustomLogo()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var loginLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Email", font: DesignerSystem.Fonts.fontDefault, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()

    lazy var loginTextField: UITextField = {
        let textfield = CustomTextField(placeholder: "Digite seu email", image: UIImage(systemName: "person")!)
        return textfield
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Senha", font: DesignerSystem.Fonts.fontDefault, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textfield = CustomTextField(placeholder: "Digite sua senha", image: UIImage(systemName: "lock")!)
        return textfield
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = CustomButton(title: "Esqueceu a senha ?", fontSize: 14)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = CustomButton(title: "Entrar")
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = CustomButton(title: "Personal Trainer ? Cadastre-se", fontSize: 16)
        return button
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configSetup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func configSetup(){
        backgroundColor = DesignerSystem.Colors.primaryColor
        configElements()
        configConstraints()
    }
    
    private func configElements(){
        addSubview(logoCheckFitnee)
        addSubview(loginLabel)
        addSubview(loginTextField)
        addSubview(passwordLabel)
        addSubview(passwordTextField)
        addSubview(forgotPasswordButton)
        addSubview(loginButton)
        addSubview(registerButton)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
        
            logoCheckFitnee.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoCheckFitnee.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoCheckFitnee.heightAnchor.constraint(equalToConstant: 80),
            logoCheckFitnee.widthAnchor.constraint(equalToConstant: 80),
            
            loginLabel.topAnchor.constraint(equalTo: logoCheckFitnee.bottomAnchor,constant: 70),
            loginLabel.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 25),
            
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 15),
            loginTextField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor,constant: 15),
            passwordLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 15),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: trailingAnchor,constant: -40),
            
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor,constant: 70),
            loginButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 60),
            
            registerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor),
            registerButton.centerXAnchor.constraint(equalTo: centerXAnchor)
        
        ])
    }
    
}
