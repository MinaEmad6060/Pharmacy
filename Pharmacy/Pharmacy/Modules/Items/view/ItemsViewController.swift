//
//  ItemsViewController.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet weak var emptyText: UILabel!
    @IBOutlet weak var itemsTableView: UITableView!
    
    var itemViewModel: ItemsViewModelProtocol?
    var itemList: [ItemViewData]?
    var deleteItem: (()->())?
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
        initViewModel()
    }
    
    
    private func initViewController(){
        itemList = [ItemViewData]()
        emptyText.isHidden = true
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        Utils.registerNewTableViewCell(tableView: itemsTableView, cellClass: "ItemTableViewCell", cellName: "itemCell")
        itemsTableView.separatorStyle = .none
        deleteItem = {
            
        }
    }
    
    
    private func initViewModel(){
        itemViewModel = ItemsViewModel()
        itemViewModel?.getAllItems()
        itemViewModel?.bindItemsToViewController = {
            self.itemList = self.itemViewModel?.itemList
            DispatchQueue.main.async {
                self.itemsTableView.reloadData()
            }
        }
        
        itemViewModel?.bindDeleteItemToViewController = {
            DispatchQueue.main.async {
                self.view.makeToast("Item Deleted Successfully!", duration: 2.0, position: .bottom)
            }
        }
    }
    
    
    private func initUpdatedItem(row: Int){
        Utils.updatedItem = ItemViewData()
        Utils.updatedItem?.ndc = itemList?[row].ndc
        Utils.updatedItem?.manufacturer = itemList?[row].manufacturer
        Utils.updatedItem?.fullQuantity = itemList?[row].fullQuantity
        Utils.updatedItem?.partialQuantity = itemList?[row].partialQuantity
        Utils.updatedItem?.expirationDate = itemList?[row].expirationDate
        Utils.updatedItem?.lotNumber = itemList?[row].lotNumber
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if itemList?.count ?? 0 > 0 {
            itemsTableView.isHidden = false
            emptyText.isHidden = true
            return itemList?.count ?? 0
        }else {
            itemsTableView.isHidden = true
            emptyText.isHidden = false
            return 0
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTableViewCell

        cell.ndcText.text = itemList?[indexPath.row].ndc
        cell.descriptionText.text = itemList?[indexPath.row].description
        cell.manufacturerText.text = itemList?[indexPath.row].manufacturer
        cell.fullQuantityText.text = String(itemList?[indexPath.row].fullQuantity ?? 0)
        cell.partialQuantityText.text = String(itemList?[indexPath.row].partialQuantity ?? 0)
        cell.expirationDateText.text = itemList?[indexPath.row].expirationDate
        cell.lotNumberText.text = itemList?[indexPath.row].lotNumber

        cell.btnUpdateItemTapped = { [weak self] in
            guard let self = self else { return }
            initUpdatedItem(row: indexPath.row)
            Utils.currentItem = itemList?[indexPath.row].id
            Utils.navigateToNextScreen(view: self, storyboard: "Main", nextScreen: "updateItemVC")
        }
        
        return cell
    }
    
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
            if editingStyle == .delete {
                Utils.showAlert(title: "Delete Item", message: "Are you sure you want to delete this item?", view: self){
                    Utils.currentItem = self.itemList?[indexPath.row].id
                    self.itemList?.remove(at: indexPath.row)
                    self.itemViewModel?.deleteItem(at: indexPath.row)
                    self.itemViewModel?.deleteItemFromAPI()
                    tableView.deleteRows(at: [indexPath], with: .automatic)
                }
            }
        }
    
    
    @IBAction func btnBack(_ sender: Any) {
        dismiss(animated: true)
    }

}

struct ItemViewData{
    var id: Int?
    var ndc: String?
    var description: String?
    var manufacturer: String?
    var fullQuantity: Double?
    var partialQuantity: Double?
    var expirationDate: String?
    var lotNumber: String?
}


