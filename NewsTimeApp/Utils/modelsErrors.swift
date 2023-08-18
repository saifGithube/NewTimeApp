//
//  modelsErrors.swift
//  NewsTimeApp
//
//  Created by saif on 15/08/2023.
//

import Foundation


// MARK: - News Error

struct NewsModelError: Codable {
    var status, message: String?
    var error: String?
    var data: [String:String]?

}
