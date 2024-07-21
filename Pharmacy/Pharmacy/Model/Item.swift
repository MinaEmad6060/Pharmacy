//
//  Item.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation

struct ReturnRequestItem: Codable{
    var id: Int?
    var ndc: String?
    var description: String?
    var manufacturer: String?
    var fullQuantity: Double?
    var partialQuantity: Double?
    var expirationDate: String?
    var lotNumber: String?
}



struct CreateReturnRequestItem: Codable{
    var id: Int?
    var createdAt: String?
}
