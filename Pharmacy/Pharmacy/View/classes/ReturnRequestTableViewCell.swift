//
//  ReturnRequestTableViewCell.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import UIKit

class ReturnRequestTableViewCell: UITableViewCell {

    var btnShowItemsTapped: (() -> Void)?
    
    @IBOutlet weak var bgView: UIView!
    @IBOutlet weak var idText: UILabel!
    @IBOutlet weak var createdAtText: UILabel!
    @IBOutlet weak var statusText: UILabel!
    @IBOutlet weak var itemsText: UILabel!
    @IBOutlet weak var serviceText: UILabel!
    @IBOutlet weak var wholesalerText: UILabel!
    @IBOutlet weak var btnShowItemsOutlet: UIButton!
    
    @IBAction func btnShowItems(_ sender: Any) {
        btnShowItemsTapped?()
    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        bgView.layer.cornerRadius = 16
        bgView.layer.borderWidth = 1
        bgView.layer.borderColor = UIColor.gray.cgColor

        btnShowItemsOutlet.layer.cornerRadius = 16
        
    }
    
}
/**
 

 
 
 
 @IBAction func btnTripDetails(_ sender: Any) {
     btnTripDetailsTapped?()
 }
 override func awakeFromNib() {
     super.awakeFromNib()
     // Initialization code
 }

 override func setSelected(_ selected: Bool, animated: Bool) {
     super.setSelected(selected, animated: animated)
     
     bgView.layer.cornerRadius = 16
     bgView.layer.borderWidth = 1
     bgView.layer.borderColor = Utils.borderColor.cgColor
     
     btnTripDetailsOutlet.layer.cornerRadius = 16
     Utils.setTitleForButton(btnOutlet: btnTripDetailsOutlet, key: "tripDetailsBtnTitle")

     // Configure the view for the selected state
 }
 */
