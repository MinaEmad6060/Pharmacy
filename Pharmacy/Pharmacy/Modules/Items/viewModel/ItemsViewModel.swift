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
        print("returnRequestId : \(UserDefaults.standard.string(forKey: "returnRequestId") ?? "")")
    }
    
    
    func getAllItems() {
        networkManager?.getDataFromAPI(url: networkManager?.formatURL(request: "pharmacies/191/returnrequests/\(returnRequestId ?? "")/items") ?? "", headers: Utils.getHeaders){ (response: Item?) in
            if let returnRequestItems = response?.returnRequestItems {
                var item = ItemViewData()
                for i in 0..<returnRequestItems.count{
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
