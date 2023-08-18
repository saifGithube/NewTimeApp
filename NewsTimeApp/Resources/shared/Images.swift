//
//  Images.swift
//  NewsTimeApp
//
//  Created by saif on 16/08/2023.
//

import Foundation
import UIKit
class ImageManager {
    
    static let custom_back_button_white = "backButton"
    
    static func setImage(_ urlString: inout String, targetImageView: UIImageView){
     
        if  let imageURL = URL(string:urlString)  {
            DispatchQueue.global().async {
                      if let imageData = try? Data(contentsOf: imageURL),
                         let image = UIImage(data: imageData) {
                          DispatchQueue.main.async {
                              targetImageView.image = image
                          }
                      }
                  }
        }
    }
}
