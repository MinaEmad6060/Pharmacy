//
//  LoginViewModelProtocol.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation


protocol LoginViewModelProtocol {
    var bindLoginUserToViewController : (()->())? { get set}
    var networkManager: NetworkManager? { get }
    var userName: String? { get set}
    var password: String? { get set}
    func loginUser()
}
