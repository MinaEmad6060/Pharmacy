//
//  ItemsViewModel.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation

class ItemsViewModel: ItemsViewModelProtocol{
    var bindItemsToViewController: (() -> ())?
    var bindNewItemToViewController: (() -> ())?
    
    var networkManager: NetworkManager?
    var itemList: [ItemViewData]?
    
//    let returnRequestId = UserDefaults.standard.string(forKey: "returnRequestId")
    let returnRequestId = String(Utils.currentReturnRequest ?? 0)
    
    var ndc: String?
    var description: String?
    var manufacturer: String?
    var fullQuantity: Double?
    var partialQuantity: Double?
    var expirationDate: String?
    var lotNumber: String?
    
    init(){
        networkManager = NetworkManager()
        itemList = [ItemViewData]()
    }
    
    
    func getAllItems() {
        networkManager?.getDataFromAPI(url: networkManager?.formatURL(request: "pharmacies/191/returnrequests/\(returnRequestId)/items") ?? "", headers: Utils.getHeaders){ (response: [ReturnRequestItem]?) in
            if let returnRequestItems = response {
                var item = ItemViewData()
                for i in 0..<returnRequestItems.count{
                    item.id = returnRequestItems[i].id
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
    
    
    func addNewItem() {
        print("addNewItem : \(networkManager?.formatURL(request: "pharmacies/191/returnrequests/\(Utils.currentReturnRequest ?? 0)/items") ?? "")")
        let body: [String: Any] = [
            "ndc": ndc ?? "",
            "description": description ?? "",
            "manufacturer": manufacturer ?? "",
            "packageSize": "200",
            "requestType": "csc",
            "name": "Best Item Name",
            "strength": "strong",
            "dosage": "alssot",
            "fullQuantity": fullQuantity ?? "",
            "partialQuantity": partialQuantity ?? "",
            "expirationDate": expirationDate ?? "",
            "status": "PENDING",
            "lotNumber": lotNumber ?? ""
        ]

        networkManager?.postDataToAPI(url: networkManager?.formatURL(request: "pharmacies/191/returnrequests/\(Utils.currentReturnRequest ?? 0)/items") ?? "", headers: Utils.postHeaders, body: body){
            (result: Result<CreateReturnRequestItem?, Error>) in
            switch result {
            case .success(let newItem):
                print("userReturnRequest: \(newItem?.id ?? -1)")
                self.bindNewItemToViewController?()
            case .failure(let error):
                print("Error: \(error)")
            }
            
        }
    }
    
    
    
}
