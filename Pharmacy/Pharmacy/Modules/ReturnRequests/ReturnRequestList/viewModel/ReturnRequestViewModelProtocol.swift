//
//  ReturnRequestViewModelProtocol.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation


protocol ReturnRequestViewModelProtocol{
    var bindReturnRequestToViewController : (()->())? { get set}
    var bindWholesalersToViewController: (() -> ())? { get set}
    var bindNewReturnRequestToViewController: (() -> ())? { get set}
    var networkManager: NetworkManager? { get }
    var returnRequestList: [ReturnRequestViewData]? { get }
    var wholesalerList: [String]? { get }
    var serviceType: String? { get set}
    var wholesalerId: String? { get set}
    func getAllReturnRequests()
    func getAllWholesalers() 
    func createReturnRequest()
}
