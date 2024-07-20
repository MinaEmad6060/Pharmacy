//
//  Utils.swift
//  Pharmacy
//
//  Created by Mina Emad on 20/07/2024.
//

import Foundation
import UIKit
import Alamofire


class Utils{
    
    static var activeBtntnColor = UIColor(red: 0xed/255.0, green: 0x7e/255.0, blue: 0x52/255.0, alpha: 1.0)
    static var disabledBtnColor = UIColor(red: 0xEF/255.0, green: 0xEF/255.0, blue: 0xEF/255.0, alpha: 1.0)
    
    
    static var postHeaders: HTTPHeaders = [
        "Accept": "application/json"
    ]

    
    static func navigateToNextScreen(view: UIViewController, storyboard: String, nextScreen: String){
        let storyboard = UIStoryboard(name: storyboard, bundle: nil)
        let productInfoVC = storyboard.instantiateViewController(withIdentifier: nextScreen)
        productInfoVC.modalPresentationStyle = .fullScreen
        view.present(productInfoVC, animated: true, completion: nil)
    }
}
