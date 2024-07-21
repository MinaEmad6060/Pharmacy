//
//  LoginViewModel.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation
import Alamofire


class LoginViewModel: LoginViewModelProtocol{
    
    var bindLoginUserToViewController: (() -> ())?
    var networkManager: NetworkManager?
    var userName: String?
    var password: String?

    
    init(){
        networkManager = NetworkManager()
    }
    
    
    func loginUser() {
        
        let body: [String: Any] = [
            "username": userName ?? "",
            "password": password ?? ""
        ]

        networkManager?.postDataToAPI(url: networkManager?.formatURL(request: "auth") ?? "", headers: Utils.postHeaders, body: body){
            (result: Result<LoginUser?, Error>) in
            switch result {
            case .success(let loginUser):
                if let token = loginUser?.token{
                    print("ResponseToken: \(token)")
                    UserDefaults.standard.set(token, forKey: "userToken")
                    self.bindLoginUserToViewController?()
                } else {
                    print("No Data: \(loginUser?.token ?? "none")")
                }
            case .failure(let error):
                print("Error: \(error)")
            }
            
        }
    }
    
    
}
