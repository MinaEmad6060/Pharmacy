//
//  UpdateItemViewController.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import UIKit

class UpdateItemViewController: UIViewController {

    @IBOutlet weak var descriptionTextField: UITextField!
    @IBOutlet weak var btnUpdateOutlet: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        print("current-item : \(Utils.currentItem ?? -1)")
        // Do any additional setup after loading the view.
    }
   
    
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func btnUpdate(_ sender: Any) {
    }
    
}
