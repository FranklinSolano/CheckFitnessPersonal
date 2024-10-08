//
//  RegisterViewController.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import UIKit
import Modulo_DesignerSystem

protocol RegisterViewControllerDisplay: AnyObject {
    func showAlert(title: String, message: String)
}

class RegisterViewController: UIViewController, RegisterViewControllerDisplay, UITextFieldDelegate {
    
    lazy var backButton: UIButton = {
        let button = CustomButton(title: "Voltar", fontSize: 14)
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var logoImage: UIView = {
        let view = CustomLogo()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    lazy var nameTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Nome Completo", image: UIImage(systemName: "person")!)
        textField.configureTextField(delegate: self, isSecure: false, keyboardType: .default, autocapitalization: .none, placeholderColor: .darkGray)
        return textField
    }()
    
    lazy var emailTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Email", image: UIImage(systemName: "envelope")!)
        textField.configureTextField(delegate: self, isSecure: false, keyboardType: .emailAddress, autocapitalization: .none, placeholderColor: .darkGray)
        return textField
    }()
    
    
    lazy var passwordTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Senha", image: UIImage(systemName: "lock")!)
        textField.configureTextField(delegate: self, isSecure: true, keyboardType: .default, autocapitalization: .none, placeholderColor: .darkGray)
        return textField
    }()
    
    
    lazy var confirmedPasswordTextField: UITextField = {
        let textField = CustomTextField(placeholder: "Confirmar Senha", image: UIImage(systemName: "lock")!)
        textField.configureTextField(delegate: self, isSecure: true, keyboardType: .default, autocapitalization: .none, placeholderColor: .darkGray)
        return textField
    }()
    
    lazy var registerButton: UIButton = {
        let button = CustomButton(title: "Cadastrar")
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return button
    }()
    
    var interactor: RegisterInteracting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSetup()
        self.navigationItem.hidesBackButton = true
    }
    
    
    
    private func configSetup(){
        view.backgroundColor = DesignerSystem.Colors.primaryColor
        configElements()
        configConstraints()
        hideKeyboardWhenTappedAround()
    }
    
    private func configElements(){
        view.addSubview(backButton)
        view.addSubview(logoImage)
        view.addSubview(nameTextField)
        view.addSubview(emailTextField)
        view.addSubview(passwordTextField)
        view.addSubview(confirmedPasswordTextField)
        view.addSubview(registerButton)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            logoImage.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 45),
            logoImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoImage.heightAnchor.constraint(equalToConstant: 80),
            logoImage.widthAnchor.constraint(equalToConstant: 80),
            
            nameTextField.topAnchor.constraint(equalTo: logoImage.bottomAnchor, constant: 70),
            nameTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            nameTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
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
            
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -40),
            registerButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            registerButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            registerButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func backTapped() {
        interactor?.navigateToLogin()
    }
    
    @objc private func registerTapped() {
        guard let username = nameTextField.text,
              let email = emailTextField.text,
              let password = passwordTextField.text,
              let confirmPassword = confirmedPasswordTextField.text else { return }
        interactor?.callService(username: username, email: email, password: password, confirmPassword: confirmPassword)
    }
    
    
    
    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title,
                                      message: message,
                                      preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK",
                                      style: .default,
                                      handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    
}


