//
//  NetworkManager.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation
import Alamofire

class NetworkManager: NetworkManagerProtocol{
    var baseUrl = "https://portal-test.rxmaxreturns.com/rxmax"
   
    func formatURL(request: String) -> String{
        return baseUrl + "/" + request
    }
    
    func getDataFromAPI<T: Decodable>(url: String, headers: HTTPHeaders, handler: @escaping (T) -> Void) {
        AF.request(url, headers: headers).responseDecodable(of: T.self) { response in
            switch response.result {
            case .success(let data):
                print("success: \(data)")
                handler(data)
            case .failure(let error):
                print("Error: \(error.localizedDescription)")
            }
        }
    }
    
    func postDataToAPI<T: Decodable>(url: String, headers: HTTPHeaders, body: [String: Any], handler: @escaping (Result<T?, Error>) -> Void) {
        AF.request(url, method: .post, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let registerResponse):
                    handler(.success(registerResponse))
                case .failure(let error):
                    handler(.failure(error))
                }
            }
    }
    
    func updateDataOnAPI<T: Decodable>(url: String, headers: HTTPHeaders, body: [String: Any], handler: @escaping (Result<T?, Error>) -> Void) {
        AF.request(url, method: .put, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let registerResponse):
                    handler(.success(registerResponse))
                case .failure(let error):
                    handler(.failure(error))
                }
            }
    }
    
    
    func deleteDataFromAPI<T: Decodable>(url: String, headers: HTTPHeaders, body: [String: Any], handler: @escaping (Result<T?, Error>) -> Void) {
        AF.request(url, method: .delete, parameters: body, encoding: JSONEncoding.default, headers: headers)
            .responseDecodable(of: T.self) { response in
                switch response.result {
                case .success(let registerResponse):
                    handler(.success(registerResponse))
                case .failure(let error):
                    handler(.failure(error))
                }
            }
    }
    
}
