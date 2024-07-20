//
//  ItemsViewController.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import UIKit

class ItemsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource  {

    
    @IBOutlet weak var itemsTableView: UITableView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        itemsTableView.delegate = self
        itemsTableView.dataSource = self
        
        let customCell = UINib(nibName: "ItemTableViewCell", bundle: nil)
        itemsTableView.register(customCell.self, forCellReuseIdentifier: "itemCell")
        
        itemsTableView.separatorStyle = .none
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "itemCell", for: indexPath) as! ItemTableViewCell
        
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


