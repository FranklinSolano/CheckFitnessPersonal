//
//  RegisterScreen.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 24/09/24.
//

import UIKit
import Modulo_DesignerSystem

class RegisterScreen: UIView {
    
    lazy var BackButton: UIButton = {
        let button = CustomButton(title: "Voltar", fontSize: 14)
        return button
    }()
    
    lazy var logoImage: UIView = {
        let view = CustomLogo()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Nome Completo", image: UIImage(systemName: "person")!)
        textField.configureTextField(isSecure: false, keyboardType: .default, autocapitalization: .none, placeholderColor: .darkGray)
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Email", image: UIImage(systemName: "envelope")!)
        textField.configureTextField(isSecure: false, keyboardType: .emailAddress, autocapitalization: .none, placeholderColor: .darkGray)
        return textField
    }()
    
    
    lazy var passwordTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Senha", image: UIImage(systemName: "lock")!)
        textField.configureTextField(isSecure: true, keyboardType: .default, autocapitalization: .none, placeholderColor: .darkGray)
        return textField
    }()
    
    
    lazy var confirmedPasswordTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Confirmar Senha", image: UIImage(systemName: "lock")!)
        textField.configureTextField(isSecure: true, keyboardType: .default, autocapitalization: .none, placeholderColor: .darkGray)
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        let button = CustomButton(title: "Cadastrar")
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
        addSubview(BackButton)
        addSubview(logoImage)
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(confirmedPasswordTextField)
        addSubview(registerButton)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            BackButton.topAnchor.constraint(equalTo: topAnchor,constant: 50),
            BackButton.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 25),
            
            logoImage.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor),
            logoImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 80),
            logoImage.widthAnchor.constraint(equalToConstant: 80),
            
            nameTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 70),
            nameTextField.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -20),
            nameTextField.heightAnchor.constraint(equalToConstant: 50),
            
            emailTextField.topAnchor.constraint(equalTo: nameTextField.bottomAnchor, constant: 15),
            emailTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            emailTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordTextField.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            confirmedPasswordTextField.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 15),
            confirmedPasswordTextField.leadingAnchor.constraint(equalTo: nameTextField.leadingAnchor),
            confirmedPasswordTextField.trailingAnchor.constraint(equalTo: nameTextField.trailingAnchor),
            confirmedPasswordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.bottomAnchor.constraint(equalTo: safeAreaLayoutGuide.bottomAnchor,constant: -40),
            registerButton.leadingAnchor.constraint(equalTo: leadingAnchor,constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
}
