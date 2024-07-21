//
//  DropDownList.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation
import DropDown


class DropDownList{
    let dropDownList = DropDown()
    
    func setDropDwonList(view: UIButton, list: [String]){
        dropDownList.anchorView = view
        dropDownList.dataSource = list
        dropDownList.bottomOffset = CGPoint(x: 0, y: (dropDownList.anchorView?.plainView.bounds.height)!)
        dropDownList.topOffset = CGPoint(x: 0, y: (dropDownList.anchorView?.plainView.bounds.height)!)
        dropDownList.direction = .bottom
        dropDownList.semanticContentAttribute = .forceLeftToRight
    }
}
