//
//  ItemsViewModel.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation

class ItemsViewModel: ItemsViewModelProtocol{
    var bindItemsToViewController: (() -> ())?
    
    var networkManager: NetworkManager?
    var itemList: [ItemViewData]?
    
    let returnRequestId = UserDefaults.standard.string(forKey: "returnRequestId")
    
    init(){
        networkManager = NetworkManager()
        itemList = [ItemViewData]()
    }
    
    
    func getAllItems() {
        networkManager?.getDataFromAPI(url: networkManager?.formatURL(request: "pharmacies/191/returnrequests/\(returnRequestId ?? "")/items") ?? "", headers: Utils.getHeaders){ (response: [ReturnRequestItem]?) in
            if let returnRequestItems = response {
                var item = ItemViewData()
                for i in 0..<returnRequestItems.count{
                    item.ndc = returnRequestItems[i].ndc
                    item.description = returnRequestItems[i].description
                    item.manufacturer = returnRequestItems[i].manufacturer
                    item.fullQuantity = returnRequestItems[i].fullQuantity
                    item.partialQuantity = returnRequestItems[i].partialQuantity
                    item.expirationDate = returnRequestItems[i].expirationDate
                    item.lotNumber = returnRequestItems[i].lotNumber
                    self.itemList?.append(item)
                }
                print("self.returnRequestList : \(self.itemList?.count ?? -1)")
                self.bindItemsToViewController?()
            } else {
                print("Failed to fetch Data")
            }
        }
    }
    
    
    
}
