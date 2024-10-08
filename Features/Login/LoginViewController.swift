//
//  ViewController.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 19/09/24.
//

import Modulo_DesignerSystem
import SnapKit

protocol LoginViewControllerDisplay: AnyObject {
    func showAlert(title:String, message:String)
    
}

class LoginViewController: UIViewController, LoginViewControllerDisplay, UITextFieldDelegate {

    
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
    
    lazy var emailTextField: UITextField = {
        let textfield = CustomTextField(placeholder: "Digite seu email", image: UIImage(systemName: "person")!)
        textfield.configureTextField(delegate: self, isSecure: false, keyboardType: .emailAddress, autocapitalization: .none, placeholderColor: .darkGray)
        return textfield
    }()
    
    lazy var passwordLabel: UILabel = {
        let label = UILabel()
        label.configLabel(text: "Senha", font: DesignerSystem.Fonts.fontDefault, textColor: DesignerSystem.Colors.thirdColor)
        return label
    }()
    
    lazy var passwordTextField: UITextField = {
        let textfield = CustomTextField(placeholder: "Digite sua senha", image: UIImage(systemName: "lock")!)
        textfield.configureTextField(delegate: self, isSecure: true, keyboardType: .default, autocapitalization: .none, placeholderColor: .darkGray)
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
        hideKeyboardWhenTappedAround()
    }
    
    private func configElements(){
        view.addSubview(logoCheckFitnee)
        view.addSubview(loginLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(forgotPasswordButton)
        view.addSubview(loginButton)
        view.addSubview(registerButton)
    }
    
    private func configConstraints(){
        configLogoImageConstraints()
        configLoginLabelConstraints()
        configEmailTextFieldConstraints()
        configPasswordLabelConstraints()
        configPasswordTextFieldConstraints()
        configForgotPasswordButtonConstraints()
        configLoginButtonConstraints()
        configRegisterButtonConstraints()
    }
    
    private func configLogoImageConstraints(){
        logoCheckFitnee.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(45)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
    }
    
    private func configLoginLabelConstraints(){
        loginLabel.snp.makeConstraints { make in
            make.top.equalTo(logoCheckFitnee.snp.bottom).offset(70)
            make.leading.equalToSuperview().offset(25)
        }
    }
    
    private func configEmailTextFieldConstraints(){
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(loginLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    private func configPasswordLabelConstraints(){
        passwordLabel.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(loginLabel.snp.leading)
        }
    }
    
    private func configPasswordTextFieldConstraints(){
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordLabel.snp.bottom).offset(15)
            make.leading.equalTo(emailTextField.snp.leading)
            make.trailing.equalTo(emailTextField.snp.trailing)
            make.height.equalTo(emailTextField.snp.height)
        }
    }
    
    private func configForgotPasswordButtonConstraints(){
        forgotPasswordButton.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.trailing.equalToSuperview().inset(40)
        }
    }
    
    private func configLoginButtonConstraints(){
        loginButton.snp.makeConstraints { make in
            make.top.equalTo(forgotPasswordButton.snp.bottom).offset(70)
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(50)
        }
    }
    
    private func configRegisterButtonConstraints(){
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom)
            make.centerX.equalToSuperview()
        }
    }
    
    
    @objc private func loginTapped() {
        print("Primeiro Fluxo: LoginViewController")

        guard let username = emailTextField.text,
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
