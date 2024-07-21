//
//  CreateReturnRequestViewController.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import UIKit
import Toast_Swift

class CreateReturnRequestViewController: UIViewController {

    @IBOutlet weak var btnSubmitOutlet: UIButton!
    @IBOutlet weak var btnServiceOutlet: UIButton!
    @IBOutlet weak var btnWholesalerOutlet: UIButton!
    
    var serviceDropDownList: DropDownList?
    var wholesalerDropDownList: DropDownList?
    var serviceList = ["EXPRESS_SERVICE", "FULL_SERVICE"]
    var wholesalerList: [String]?
    var returnRequestViewModel: ReturnRequestViewModelProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewModel()
        initServiceDropDownList()
        initBtns()
    }
    
    private func initServiceDropDownList(){
        serviceDropDownList = DropDownList()
        serviceDropDownList?.setDropDwonList(view: btnServiceOutlet, list: serviceList)
        serviceDropDownList?.dropDownList.selectionAction = { [weak self]
            (index: Int , item: String) in
            self?.btnServiceOutlet.setTitle(self?.serviceList[index], for: .normal)
            self?.returnRequestViewModel?.serviceType = self?.serviceList[index]
        }
    }
    
    
    private func initWholesalerDropDownList(){
        wholesalerDropDownList = DropDownList()
        wholesalerDropDownList?.setDropDwonList(view: btnWholesalerOutlet, list: wholesalerList ?? [])
        wholesalerDropDownList?.dropDownList.selectionAction = { [weak self]
            (index: Int , item: String) in
            self?.btnWholesalerOutlet.setTitle(self?.wholesalerList?[index], for: .normal)
            self?.returnRequestViewModel?.wholesalerId = self?.wholesalerList?[index]

        }
    }
    
    private func initViewModel(){
        wholesalerList = [String]()
        returnRequestViewModel = ReturnRequestViewModel()
        returnRequestViewModel?.getAllWholesalers()
        returnRequestViewModel?.bindWholesalersToViewController = {
            DispatchQueue.main.async {
                self.wholesalerList = self.returnRequestViewModel?.wholesalerList
                self.initWholesalerDropDownList()
                print("self.wholesalerList : \(self.wholesalerList?.count ?? -1)")
            }
        }
        
        returnRequestViewModel?.bindNewReturnRequestToViewController = {
            DispatchQueue.main.async {
                if self.btnServiceOutlet.titleLabel?.text == "Service Type  " || self.btnWholesalerOutlet.titleLabel?.text == "Wholesaler   " {
                    self.view.makeToast("Please complete all fields", duration: 2.0, position: .bottom)
                }else{
                    self.view.makeToast("Request Created Successfully!", duration: 2.0, position: .bottom)
                    Utils.navigateToNextScreen(view: self, storyboard: "Main", nextScreen: "newItemVC")
                }
            }
        }
    }
    
    private func initBtns(){
        btnServiceOutlet.layer.cornerRadius = 10
        btnWholesalerOutlet.layer.cornerRadius = 10
        btnSubmitOutlet.layer.cornerRadius = 16
    }
    
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }
    
    
    @IBAction func btnService(_ sender: Any) {
        serviceDropDownList?.dropDownList.show()
    }
    
    @IBAction func btnWholesaler(_ sender: Any) {
        wholesalerDropDownList?.dropDownList.show()
    }
    
    
    
    @IBAction func btnSubmit(_ sender: Any) {
        returnRequestViewModel?.createReturnRequest()
    }
    
}
