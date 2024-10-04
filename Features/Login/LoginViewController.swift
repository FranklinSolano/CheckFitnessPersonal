//
//  ViewController.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 19/09/24.
//

import UIKit
import Modulo_DesignerSystem

protocol LoginViewControllerDisplay: AnyObject {
    func showAlert(title:String, message:String)
    
}

class LoginViewController: UIViewController, LoginViewControllerDisplay, TextFieldConfigurable {
    
    
    func configureTextField() {
        loginTextField.configureTextField(delegate: self, isSecure: false, keyboardType: .emailAddress, autocapitalization: .none, placeholderColor: .darkGray)
        passwordTextField.configureTextField(delegate: self, isSecure: true, keyboardType: .default, autocapitalization: .none, placeholderColor: .darkGray)
    }
    

    
    
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
//        textfield.configureTextField(delegate: self, isSecure: false, keyboardType: .emailAddress, autocapitalization: .none, placeholderColor: .darkGray)
        return textfield
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Senha", font: DesignerSystem.Fonts.fontDefault, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textfield = CustomTextField(placeholder: "Digite sua senha", image: UIImage(systemName: "lock")!)
//        textfield.configureTextField(delegate: self, isSecure: true, keyboardType: .default, autocapitalization: .none, placeholderColor: .darkGray)
        return textfield
    }()
    
    lazy var forgotPasswordButton: UIButton = {
        let button = CustomButton(title: "Esqueceu a senha ?", fontSize: 14)
        button.addTarget(self, action: #selector(forgotPasswordTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var loginButton: UIButton = {
        let button = CustomButton(title: "Entrar")
        button.addTarget(self, action: #selector(loginTapped), for: .touchUpInside)
        return button
    }()
    
    lazy var registerButton: UIButton = {
        let button = CustomButton(title: "Personal Trainer ? Cadastre-se", fontSize: 16)
        button.addTarget(self, action: #selector(registerTapped), for: .touchUpInside)
        return button
    }()
    
    var interactor: LoginInteracting?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configSetup()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // Esconde a Navigation Bar
        self.navigationController?.setNavigationBarHidden(true, animated: animated)
    }
    
    private func configSetup(){
        
        view.backgroundColor = DesignerSystem.Colors.primaryColor
        configElements()
        configConstraints()
        configureTextField()
    }
    
    private func configElements(){
        view.addSubview(logoCheckFitnee)
        view.addSubview(loginLabel)
        view.addSubview(loginTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
    }
    
    private func configConstraints(){
        NSLayoutConstraint.activate([
            
            logoCheckFitnee.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor,constant: 45),
            logoCheckFitnee.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            logoCheckFitnee.heightAnchor.constraint(equalToConstant: 80),
            logoCheckFitnee.widthAnchor.constraint(equalToConstant: 80),
            
            loginLabel.topAnchor.constraint(equalTo: logoCheckFitnee.bottomAnchor,constant: 70),
            loginLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 25),
            
            loginTextField.topAnchor.constraint(equalTo: loginLabel.bottomAnchor, constant: 15),
            loginTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 20),
            loginTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            loginTextField.heightAnchor.constraint(equalToConstant: 50),
            
            passwordLabel.topAnchor.constraint(equalTo: loginTextField.bottomAnchor,constant: 15),
            passwordLabel.leadingAnchor.constraint(equalTo: loginLabel.leadingAnchor),
            
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 15),
            passwordTextField.leadingAnchor.constraint(equalTo: loginTextField.leadingAnchor),
            passwordTextField.trailingAnchor.constraint(equalTo: loginTextField.trailingAnchor),
            passwordTextField.heightAnchor.constraint(equalToConstant: 50),
            
            forgotPasswordButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor,constant: 15),
            forgotPasswordButton.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -40),
            
            loginButton.topAnchor.constraint(equalTo: forgotPasswordButton.bottomAnchor,constant: 70),
            loginButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            loginButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            loginButton.heightAnchor.constraint(equalToConstant: 50),
            
            registerButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            registerButton.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
    }
    
    @objc private func loginTapped() {
        print("Primeiro Fluxo: LoginViewController")

        guard let username = loginTextField.text,
              let password = passwordTextField.text else { return }
        
        interactor?.callService(username: username, password: password)
        
        
    }
    
    @objc private func forgotPasswordTapped() {
        print("Primeiro Fluxo: LoginViewController")

        interactor?.navigateToForgotPassword()    }
    
    @objc private func registerTapped() {
        print("Primeiro Fluxo: LoginViewController")

        interactor?.navigateToRegister()
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

