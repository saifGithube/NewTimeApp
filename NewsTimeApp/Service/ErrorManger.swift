//
//  ErrorManger.swift
//  NewsTimeApp
//
//  Created by saif on 20/08/2023.
//

import Foundation
import UIKit

class ErrorManger {
    
    static let shared = ErrorManger()

     func showAlert(title: String, message: String, viewController: UIViewController) {
           let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
           alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           viewController.present(alert, animated: true, completion: nil)
       }
    
    
}


