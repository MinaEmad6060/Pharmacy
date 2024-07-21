//
//  ReturnRequestViewModel.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation


class ReturnRequestViewModel: ReturnRequestViewModelProtocol{
    
    var bindReturnRequestToViewController: (() -> ())?
    var bindWholesalersToViewController: (() -> ())?
    var bindNewReturnRequestToViewController: (() -> ())?
    
    var networkManager: NetworkManager?
    
    var returnRequestList: [ReturnRequestViewData]?
    var wholesalerList: [String]?
    
    var serviceType: String?
    var wholesalerId: String?

    
    init(){
        networkManager = NetworkManager()
        returnRequestList = [ReturnRequestViewData]()
        wholesalerList = [String]()
    }
    
    
    func getAllReturnRequests() {
        networkManager?.getDataFromAPI(url: networkManager?.formatURL(request: "pharmacies/191/returnrequests") ?? "", headers: Utils.getHeaders){ (response: ReturnRequest?) in
            if let content = response?.content {
                var returnRequest = ReturnRequestViewData()
                for i in 0..<content.count{
                    returnRequest.id = content[i].returnRequest?.id
                    returnRequest.createdAt = content[i].returnRequest?.createdAt
                    returnRequest.returnRequestStatus = content[i].returnRequest?.returnRequestStatus
                    returnRequest.serviceType = content[i].returnRequest?.serviceType
                    returnRequest.numberOfItems = content[i].numberOfItems
                    returnRequest.doingBusinessAs = content[i].returnRequest?.pharmacy?.doingBusinessAs
                    self.returnRequestList?.append(returnRequest)
                }
                print("self.returnRequestList : \(self.returnRequestList?.count ?? -1)")
                self.bindReturnRequestToViewController?()
            } else {
                print("Failed to fetch Data")
            }
            
        }
    }
    
    func getAllWholesalers() {
        networkManager?.getDataFromAPI(url: networkManager?.formatURL(request: "pharmacies/191/wholesalers") ?? "", headers: Utils.getHeaders){ (response: [Wholesaler]?) in
            if let content = response {
                var wholesaler = ""
                for i in 0..<content.count{
                    wholesaler = String(content[i].id ?? 0)
                    self.wholesalerList?.append(wholesaler)
                }
                print("getAllWholesalers : \(self.wholesalerList?.count ?? -1)")
                self.bindWholesalersToViewController?()
            } else {
                print("Failed to fetch Data")
            }
            
        }
    }
    
    
    func createReturnRequest() {
 
        let body: [String: Any] = [
            "serviceType": serviceType ?? "",
            "wholesalerId": wholesalerId ?? ""
        ]

        networkManager?.postDataToAPI(url: networkManager?.formatURL(request: "pharmacies/191/returnrequests") ?? "", headers: Utils.postHeaders, body: body){
            (result: Result<CreateReturnRequestResponse?, Error>) in
            switch result {
            case .success(let userReturnRequest):
                print("userReturnRequest: \(userReturnRequest?.id ?? -1)")
                self.bindNewReturnRequestToViewController?()
            case .failure(let error):
                print("Error: \(error)")
            }
            
        }
    }
    
    

}
