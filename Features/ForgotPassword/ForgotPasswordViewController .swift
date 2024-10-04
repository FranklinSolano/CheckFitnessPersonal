//
//  LoginViewController .swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import UIKit
import Modulo_DesignerSystem


protocol ForgotPasswordViewControllerDisplay: AnyObject {
    func showAlert(title: String, message: String)
}


class ForgotPasswordViewController: UIViewController, ForgotPasswordViewControllerDisplay {

    
    
    lazy var BackButton: UIButton = {
        let button = CustomButton(title: "Voltar", fontSize: 14)
        button.addTarget(self, action: #selector(backTapped), for: .touchUpInside)
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
        textfield.configureTextField(delegate: self, isSecure: false, keyboardType: .emailAddress, autocapitalization: .none, placeholderColor: .darkGray)
        return textfield
    }()
    
    lazy var enterButton: UIButton = {
        let button = CustomButton(title: "Enviar")
        button.addTarget(self, action: #selector(toEnterTapped), for: .touchUpInside)
        return button
    }()
    
    var interactor: ForgotPasswordInteracting?

    override func viewDidLoad() {
        super.viewDidLoad()
        configSetup()
    }
    
    private func configSetup() {
        view.backgroundColor = DesignerSystem.Colors.primaryColor
        configElement()
        configConstraints()
    }
    
    private func configElement() {
        view.addSubview(BackButton)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(enterButton)
    }
    
    private func configConstraints() {
        NSLayoutConstraint.activate([
            
            BackButton.topAnchor.constraint(equalTo: view.topAnchor,constant: 50),
            BackButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            
            titleLabel.topAnchor.constraint(equalTo: BackButton.bottomAnchor, constant: 120),
            titleLabel.leadingAnchor.constraint(equalTo: BackButton.leadingAnchor),
            
            
            subtitleLabel.topAnchor.constraint(equalTo: titleLabel.bottomAnchor, constant: 15),
            subtitleLabel.leadingAnchor.constraint(equalTo: BackButton.leadingAnchor),
            subtitleLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor,constant: -20),
            
            emailTextField.topAnchor.constraint(equalTo: subtitleLabel.bottomAnchor,constant: 40),
            emailTextField.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 25),
            emailTextField.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -25),
            emailTextField.heightAnchor.constraint(equalToConstant: 50),
            
            enterButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor,constant: -40),
            enterButton.leadingAnchor.constraint(equalTo: view.leadingAnchor,constant: 30),
            enterButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30),
            enterButton.heightAnchor.constraint(equalToConstant: 50)
        ])
    }
    
    @objc private func backTapped() {
        interactor?.navegationToLogin()
    }
    
    @objc private func toEnterTapped() {
        
        guard let email = emailTextField.text else { return }
        
        interactor?.callService(email: email)
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

extension ForgotPasswordViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
