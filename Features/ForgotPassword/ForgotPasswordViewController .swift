//
//  LoginViewController .swift
//  CheckFitnessPersonal
//
//  Created by Franklin  Stilhano Solano on 03/10/24.
//

import Modulo_DesignerSystem
import SnapKit

protocol ForgotPasswordViewControllerDisplay: AnyObject {
    func showAlert(title: String, message: String)
}


class ForgotPasswordViewController: UIViewController, ForgotPasswordViewControllerDisplay, UITextFieldDelegate {

    //MARK: - Elements
    
    lazy var backButton: UIButton = {
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
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        configSetup()
    }
    
    //MARK: - Settigns-Sreen
    
    private func configSetup() { // configurar toda view
        view.backgroundColor = DesignerSystem.Colors.primaryColor
        configElement()
        configConstraints()
        hideKeyboardWhenTappedAround()
    }
    
    private func configElement() { // adicionar todos elementos na tela
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(subtitleLabel)
        view.addSubview(emailTextField)
        view.addSubview(enterButton)
    }

    private func configConstraints() { // configurar todas constraints dos elementos
        configBackButtonConstraints()
        configTitleLabelConstraints()
        configSubTitleConstraints()
        configEmailTextFieldConstraints()
        configForgotPasswordConstraints()
    }
    
    private func configBackButtonConstraints(){
        backButton.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top)
            make.leading.equalToSuperview().offset(25)
        }
    }
    
    private func configTitleLabelConstraints(){
        titleLabel.snp.makeConstraints { make in
            make.top.equalTo(view.safeAreaLayoutGuide.snp.top).offset(120)
            make.leading.equalTo(backButton.snp.leading)
        }
    }
    
    private func configSubTitleConstraints(){
        subtitleLabel.snp.makeConstraints { make in
            make.top.equalTo(titleLabel.snp.bottom).offset(15)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
        }
    }
    
    private func configEmailTextFieldConstraints(){
        emailTextField.snp.makeConstraints { make in
            make.top.equalTo(subtitleLabel.snp.bottom).offset(40)
            make.leading.equalToSuperview().offset(20)
            make.trailing.equalToSuperview().inset(20)
            make.height.equalTo(50)
        }
    }
    
    private func configForgotPasswordConstraints(){
        enterButton.snp.makeConstraints { make in
            make.bottom.equalTo(view.safeAreaLayoutGuide.snp.bottom).inset(40)
            make.leading.equalToSuperview().offset(35)
            make.trailing.equalToSuperview().inset(35)
            make.height.equalTo(50)
        }
    }
    
    //MARK: - Actions-Button
    
    @objc private func backTapped() {
        interactor?.navegationToLogin() // Primeiro Fluxo: ForgotPasswordViewController
    }
    
    @objc private func toEnterTapped() {
        guard let email = emailTextField.text else { return }
        interactor?.callService(email: email) // Primeiro Fluxo: ForgotPasswordViewController
    }
    
    //MARK: - Protocol-Method
    
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
