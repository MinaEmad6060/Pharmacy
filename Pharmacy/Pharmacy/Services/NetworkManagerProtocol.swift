//
//  NetworkManagerProtocol.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation
import Alamofire


protocol NetworkManagerProtocol{
    func formatURL(request: String) -> String
    func getDataFromAPI<T: Decodable>(url: String, headers: HTTPHeaders, handler: @escaping (T) -> Void)
    func postDataToAPI<T: Decodable>(url: String, headers: HTTPHeaders, body: [String: Any], handler: @escaping (Result<T?, Error>) -> Void)
    func updateDataOnAPI<T: Decodable>(url: String, headers: HTTPHeaders, body: [String: Any], handler: @escaping (Result<T?, Error>) -> Void)
    func deleteDataFromAPI(url: String, headers: HTTPHeaders, body: [String: Any], handler: @escaping (Result<Void, Error>) -> Void) 
}
