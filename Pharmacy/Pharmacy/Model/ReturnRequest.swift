//
//  ReturnRequest.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation


struct ReturnRequest: Codable{
    var content: [UserRequest]?
}

struct UserRequest: Codable{
    var returnRequest: UserReturnRequest?
    var numberOfItems: Int?
}


struct UserReturnRequest: Codable{
    var id: Int?
    var createdAt: Int?
    var pharmacy: Pharmacy?
    var returnRequestStatus: String?
    var serviceType: String?
}


struct Pharmacy: Codable{
    var doingBusinessAs: String?
}
