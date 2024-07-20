//
//  ItemTableViewCell.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import UIKit

class ItemTableViewCell: UITableViewCell {
    var btnUpdateItem: (() -> Void)?
    
    @IBOutlet weak var bgView: UIView!
    
    @IBOutlet weak var btnUpdateItemOutlet: UIButton!
    
    @IBAction func btnShowItems(_ sender: Any) {
        btnUpdateItem?()
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

        btnUpdateItemOutlet.layer.cornerRadius = 16
        
    }
    
}