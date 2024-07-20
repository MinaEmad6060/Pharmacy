//
//  ItemsViewModelProtocol.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation


protocol ItemsViewModelProtocol{
    var bindItemsToViewController : (()->())? { get set}
    var networkManager: NetworkManager? { get }
    var itemList: [ItemViewData]? { get }
    func getAllItems()
}
