//
//  modelsErrors.swift
//  NewsTimeApp
//
//  Created by saif on 15/08/2023.
//

import Foundation


// MARK: - News Error

struct NewsModelError: Codable, Error {  // Conform to the Error protocol
    var status, message,error: String?
    var data: [String: String]?
}
