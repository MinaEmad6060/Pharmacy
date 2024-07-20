//
//  LoginViewController.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import UIKit

class LoginViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet weak var warningText: UILabel!
    @IBOutlet weak var userNameTextFieldOutlet: UITextField!
    @IBOutlet weak var passwordTextFieldOutlet: UITextField!
    @IBOutlet weak var btnLoginOutlet: UIButton!
    
    
    var loginViewModel: LoginViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViewController()
        initViewModel()
        
    }
    
    
    private func initViewController(){
        initUserNameTextField()
        initPasswordTextField()
        warningText.isHidden = true
        btnLoginOutlet.layer.cornerRadius = 16
    }
    
    private func initUserNameTextField(){
        userNameTextFieldOutlet.delegate = self
        userNameTextFieldOutlet.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        setBorderForView(view: userNameTextFieldOutlet)
    }
    
    private func initPasswordTextField(){
        passwordTextFieldOutlet.delegate = self
        passwordTextFieldOutlet.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        setBorderForView(view: passwordTextFieldOutlet)
    }
    
    
    private func setBorderForView(view: UIView){
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.masksToBounds = true
    }
    
    private func initViewModel(){
        loginViewModel = LoginViewModel()
        loginViewModel?.bindLoginUserToViewController = {
            DispatchQueue.main.async {
                Utils.navigateToNextScreen(view: self, storyboard: "Main", nextScreen: "returnRequestVC")
            }
        }
    }
    
    
    @IBAction func loginButtonPressed(_ sender: UIButton) {
            if let userName = userNameTextFieldOutlet.text, let password = passwordTextFieldOutlet.text {
                loginViewModel?.userName = userName
                loginViewModel?.password = password
                loginViewModel?.loginUser()
            }
        }
    
    @objc func textFieldsDidChange() {
            updateButtonColor()
        }

        private func updateButtonColor() {
            if let userName = userNameTextFieldOutlet.text, !userName.isEmpty,
               let password = passwordTextFieldOutlet.text, !password.isEmpty {
                warningText.isHidden = true
                btnLoginOutlet.backgroundColor = Utils.activeBtntnColor
            } else {
                btnLoginOutlet.backgroundColor = Utils.disabledBtnColor
                warningText.isHidden = false
            }
        }
    

}
