//
//  RegisterViewController.swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import Modulo_DesignerSystem
import SnapKit

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
        configBackButtonConstraints()
        configLogoImageConstraints()
        configNameTextFieldConstraints()
        configEmailTextFieldConstraints()
        configPasswordTextFieldConstraints()
        configConfirmedPasswordTextFieldConstraints()
        configButtonRegisterConstraints()
    }
    
    private func configBackButtonConstraints(){
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(25)
        }
    }
    
    private func configLogoImageConstraints(){
        logoImage.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(45)
            make.centerX.equalToSuperview()
            make.height.equalTo(80)
            make.width.equalTo(80)
        }
    }
    
    private func configNameTextFieldConstraints(){
        nameTextField.snp.makeConstraints { make in
            make.top.equalTo(logoImage.snp.bottom).offset(70)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    private func configEmailTextFieldConstraints(){
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(nameTextField.snp.bottom).offset(15)
            make.leading.equalTo(nameTextField.snp.leading)
            make.trailing.equalTo(nameTextField.snp.trailing)
            make.height.equalTo(nameTextField.snp.height)
        }
    }
    
    private func configPasswordTextFieldConstraints(){
        passwordTextField.snp.makeConstraints { make in
            make.top.equalTo(emailTextField.snp.bottom).offset(15)
            make.leading.equalTo(nameTextField.snp.leading)
            make.trailing.equalTo(nameTextField.snp.trailing)
            make.height.equalTo(nameTextField.snp.height)
        }
    }
    
    private func configConfirmedPasswordTextFieldConstraints(){
        confirmedPasswordTextField.snp.makeConstraints { make in
            make.top.equalTo(passwordTextField.snp.bottom).offset(15)
            make.leading.equalTo(nameTextField.snp.leading)
            make.trailing.equalTo(nameTextField.snp.trailing)
            make.height.equalTo(nameTextField.snp.height)
        }
    }
    
    private func configButtonRegisterConstraints(){
        registerButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(50)
        }
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
        let previewVC = RegisterViewController()
        let navigationController = UINavigationController(rootViewController: previewVC)
        return navigationController
    }
    
    func updateUIViewController(_ uiViewController: UINavigationController, context: Context) {
        // Atualizações podem ser feitas aqui, mas pode ser deixado vazio
    }
}
