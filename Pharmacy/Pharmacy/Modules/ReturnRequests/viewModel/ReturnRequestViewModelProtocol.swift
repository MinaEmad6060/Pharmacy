//
//  ReturnRequestViewModelProtocol.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation


protocol ReturnRequestViewModelProtocol{
    var bindReturnRequestToViewController : (()->())? { get set}
    var networkManager: NetworkManager? { get }
    var returnRequestList: [ReturnRequestViewData]? { get }
    func getAllReturnRequests()
}
