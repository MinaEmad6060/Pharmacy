//
//  ItemsViewController.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet weak var itemsTableView: UITableView!
    
    var itemViewModel: ItemsViewModelProtocol?
    var itemList: [ItemViewData]?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        initViewController()
        initViewModel()
        
    }
    
    private func initViewController(){
        itemList = [ItemViewData]()
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        Utils.registerNewTableViewCell(tableView: itemsTableView, cellClass: "ItemTableViewCell", cellName: "itemCell")
        itemsTableView.separatorStyle = .none
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
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if itemList?.count ?? 0 > 0 {
            return itemList?.count ?? 0
        }else {
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

        return cell
    }
    


}

struct ItemViewData{
    var ndc: String?
    var description: String?
    var manufacturer: String?
    var fullQuantity: Double?
    var partialQuantity: Double?
    var expirationDate: String?
    var lotNumber: String?
}


