//
//  UpdateItemViewController.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import UIKit

class UpdateItemViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var btnUpdateOutlet: UIButton!
    @IBOutlet weak var warningText: UILabel!
    
    var itemViewModel: ItemsViewModelProtocol?


    override func viewDidLoad() {
        super.viewDidLoad()
        warningText.isHidden = true
        btnUpdateOutlet.isEnabled = false
        btnUpdateOutlet.layer.cornerRadius = 16
        addTargetForTextFields()
        initViewModel()
        initTextField()
    }

    
    private func initViewModel(){
        itemViewModel = ItemsViewModel()
        itemViewModel?.bindUpdateItemToViewController = {
            DispatchQueue.main.async {
                self.emptyTextFields()
                self.view.makeToast("Item Updated Successfully!", duration: 2.0, position: .bottom)
            }
        }
    }
    
    private func initTextField(){
        descriptionTextField.layer.cornerRadius = 16
        descriptionTextField.layer.borderWidth = 1
        descriptionTextField.layer.borderColor = Utils.disabledBtnColor.cgColor
    }
    
    
    private func checkTextField() {
        if let descriptionTextField = descriptionTextField.text, !descriptionTextField.isEmpty {
            btnUpdateOutlet.isEnabled = true
            warningText.isHidden = true
            btnUpdateOutlet.backgroundColor = Utils.activeBtntnColor
        } else {
            btnUpdateOutlet.isEnabled = false
            btnUpdateOutlet.backgroundColor = Utils.disabledBtnColor
            warningText.isHidden = false
        }
    }
    
    
    private func addTargetForTextFields(){
        descriptionTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        
    }
    
    
    private func emptyTextFields(){
        descriptionTextField.text = ""
    }
   
    
    @objc func textFieldsDidChange() {
        checkTextField()
    }
    
    
    private func passValuesToViewModel(){
        itemViewModel?.updatedDescription = descriptionTextField.text
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func btnUpdate(_ sender: Any) {
        passValuesToViewModel()
        itemViewModel?.updateItem()
    }
    
}
