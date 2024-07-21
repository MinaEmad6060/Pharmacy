//
//  ItemsViewModelProtocol.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation


protocol ItemsViewModelProtocol{
    var bindItemsToViewController : (()->())? { get set}
    var bindNewItemToViewController : (()->())? { get set}
    var bindDeleteItemToViewController : (()->())? { get set}
    var networkManager: NetworkManager? { get }
    var itemList: [ItemViewData]? { get }
    var ndc: String? { get set}
    var description: String? { get set}
    var manufacturer: String? { get set}
    var fullQuantity: Double? { get set}
    var partialQuantity: Double? { get set}
    var expirationDate: String? { get set}
    var lotNumber: String? { get set}
    
    func getAllItems()
    func addNewItem()
    func deleteItem(at index: Int)
    func deleteItemFromAPI()
}
