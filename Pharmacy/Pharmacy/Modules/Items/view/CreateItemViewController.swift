//
//  CreateItemViewController.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import UIKit

class CreateItemViewController: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var ndcTextField: UITextField!
    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var manufacturerTextField: UITextField!
    @IBOutlet weak var fullQuantityTextField: UITextField!
    @IBOutlet weak var partiealQuantityTextField: UITextField!
    @IBOutlet weak var expirationDateTextField: UITextField!
    @IBOutlet weak var lotNumberTextField: UITextField!
    @IBOutlet weak var btnAddOutlet: UIButton!
    @IBOutlet weak var warningText: UILabel!
    
    
    var itemViewModel: ItemsViewModelProtocol?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("CreateItemViewController : \(Utils.currentReturnRequest ?? -1)")
        btnAddOutlet.isEnabled = false
        warningText.isHidden = true
        addTargetForTextFields()
        initViewModel()
    }
    
    @objc func textFieldsDidChange() {
        checkTextField()
    }

    private func checkTextField() {
        if let ndcTextField = ndcTextField.text, !ndcTextField.isEmpty,
           let descriptionTextField = descriptionTextField.text, !descriptionTextField.isEmpty,
           let manufacturerTextField = manufacturerTextField.text, !manufacturerTextField.isEmpty,
           let fullQuantityTextField = fullQuantityTextField.text, !fullQuantityTextField.isEmpty,
           let partiealQuantityTextField = partiealQuantityTextField.text, !partiealQuantityTextField.isEmpty,
           let expirationDateTextField = expirationDateTextField.text, !expirationDateTextField.isEmpty,
           let lotNumberTextField = lotNumberTextField.text, !lotNumberTextField.isEmpty {
            btnAddOutlet.isEnabled = true
            warningText.isHidden = true
            btnAddOutlet.backgroundColor = Utils.activeBtntnColor
        } else {
            btnAddOutlet.isEnabled = false
            btnAddOutlet.backgroundColor = Utils.disabledBtnColor
            warningText.isHidden = false
        }
    }
    
    private func initViewModel(){
        itemViewModel = ItemsViewModel()
        itemViewModel?.bindNewItemToViewController = {
            DispatchQueue.main.async {
                self.emptyTextFields()
                self.view.makeToast("Item Added Successfully!", duration: 2.0, position: .bottom)
            }
        }
    }
    
    
    private func addTargetForTextFields(){
        ndcTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        descriptionTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        manufacturerTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        fullQuantityTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        partiealQuantityTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        expirationDateTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
        lotNumberTextField.addTarget(self, action: #selector(textFieldsDidChange), for: .editingChanged)
    }
    
    private func emptyTextFields(){
        ndcTextField.text = ""
        descriptionTextField.text = ""
        manufacturerTextField.text = ""
        fullQuantityTextField.text = ""
        partiealQuantityTextField.text = ""
        expirationDateTextField.text = ""
        lotNumberTextField.text = ""
    }
    
    
    private func passValuesToViewModel(){
        itemViewModel?.ndc = ndcTextField.text
        itemViewModel?.description = descriptionTextField.text
        itemViewModel?.manufacturer = manufacturerTextField.text
        itemViewModel?.fullQuantity = Double(fullQuantityTextField.text ?? "0")
        itemViewModel?.partialQuantity = Double(partiealQuantityTextField.text ?? "0")
        itemViewModel?.expirationDate = expirationDateTextField.text
        itemViewModel?.lotNumber = lotNumberTextField.text
    }
    
    
       
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    
    @IBAction func btnAdd(_ sender: Any) {
        passValuesToViewModel()
        itemViewModel?.addNewItem()
    }
    
}
