//
//  ReturnRequestViewController.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import UIKit

class ReturnRequestViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var returnRequestsTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        returnRequestsTableView.delegate = self
        returnRequestsTableView.dataSource = self
        
        let customCell = UINib(nibName: "ReturnRequestTableViewCell", bundle: nil)
        returnRequestsTableView.register(customCell.self, forCellReuseIdentifier: "returnRequestCell")
        
        returnRequestsTableView.separatorStyle = .none
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "returnRequestCell", for: indexPath) as! ReturnRequestTableViewCell
        
        return cell
    }
    

}
