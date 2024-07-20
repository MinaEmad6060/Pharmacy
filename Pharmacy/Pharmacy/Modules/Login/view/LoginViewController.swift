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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        initViewController()
        
    }
    
    
    
    private func initViewController(){
        initUserNameTextField()
        initPasswordTextField()
        warningText.isHidden = true
        btnLoginOutlet.layer.cornerRadius = 16
    }
    
    private func initUserNameTextField(){
        userNameTextFieldOutlet.delegate = self
        setBorderForView(view: userNameTextFieldOutlet)
    }
    
    private func initPasswordTextField(){
        passwordTextFieldOutlet.delegate = self
        setBorderForView(view: passwordTextFieldOutlet)
    }
    
    
    private func setBorderForView(view: UIView){
        view.layer.cornerRadius = 16
        view.layer.borderWidth = 1.0
        view.layer.borderColor = UIColor.gray.cgColor
        view.layer.masksToBounds = true
    }
    
    

}
