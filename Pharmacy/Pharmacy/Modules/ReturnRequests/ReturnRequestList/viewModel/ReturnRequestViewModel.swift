//
//  ReturnRequestViewModel.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation


class ReturnRequestViewModel: ReturnRequestViewModelProtocol{
    var bindReturnRequestToViewController: (() -> ())?
    
    var networkManager: NetworkManager?
    
    var returnRequestList: [ReturnRequestViewData]?

    
    init(){
        networkManager = NetworkManager()
        returnRequestList = [ReturnRequestViewData]()
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
    

}
