//
//  ReturnRequestViewController.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import UIKit

class ReturnRequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var emptyText: UILabel!
    @IBOutlet weak var returnRequestsTableView: UITableView!
    
    var returnRequestList: [ReturnRequestViewData]?
    var returnRequestViewModel: ReturnRequestViewModelProtocol?
    var navToLoginScreen: (()->())?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
        initTableView()
        initViewModel()
    }
    
    private func initViewController(){
        returnRequestList = [ReturnRequestViewData]()
        returnRequestList = [ReturnRequestViewData]()
        navToLoginScreen = {
            self.dismiss(animated: true)
            Utils.navigateToNextScreen(view: self, storyboard: "Main", nextScreen: "loginVC")
        }
    }
    

    private func initTableView(){
        returnRequestsTableView.delegate = self
        returnRequestsTableView.dataSource = self
        Utils.registerNewTableViewCell(tableView: returnRequestsTableView, cellClass: "ReturnRequestTableViewCell", cellName: "returnRequestCell")
        returnRequestsTableView.separatorStyle = .none
    }
    
    
    private func initViewModel(){
        returnRequestViewModel = ReturnRequestViewModel()
        returnRequestViewModel?.getAllReturnRequests()
        returnRequestViewModel?.bindReturnRequestToViewController = {
            self.returnRequestList = self.returnRequestViewModel?.returnRequestList
            DispatchQueue.main.async {
                self.returnRequestsTableView.reloadData()
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if returnRequestList?.count ?? 0 > 0 {
            returnRequestsTableView.isHidden = false
            emptyText.isHidden = true
            return returnRequestList?.count ?? 0
        }else{
            returnRequestsTableView.isHidden = true
            emptyText.isHidden = false
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "returnRequestCell", for: indexPath) as! ReturnRequestTableViewCell

        cell.idText.text = String(returnRequestList?[indexPath.row].id ?? -1)
        cell.createdAtText.text = String(returnRequestList?[indexPath.row].createdAt ?? -2)
        cell.statusText.text = returnRequestList?[indexPath.row].returnRequestStatus
        cell.serviceText.text = returnRequestList?[indexPath.row].serviceType
        cell.wholesalerText.text = returnRequestList?[indexPath.row].doingBusinessAs
        cell.itemsText.text = String(returnRequestList?[indexPath.row].numberOfItems ?? -3)

        cell.btnShowItemsTapped = { [weak self] in
            guard let self = self else { return }
            
            Utils.currentReturnRequest = returnRequestList?[indexPath.row].id
            Utils.navigateToNextScreen(view: self, storyboard: "Main", nextScreen: "allItemsVC")
        }
        
        return cell
    }
    
    @IBAction func btnLogout(_ sender: Any) {
        Utils.showAlert(view: self, action: navToLoginScreen ?? {})
    }

}


struct ReturnRequestViewData{
    var id: Int?
    var createdAt: Int?
    var returnRequestStatus: String?
    var serviceType: String?
    var numberOfItems: Int?
    var doingBusinessAs: String?
}

