//
//  DateManager.swift
//  NewsTimeApp
//
//  Created by saif on 17/08/2023.
//

import Foundation

class DateManager {
    
    static func getDateOfToday() -> String{
     
        // Create Date
        let date = Date()

        // Create Date Formatter
        let dateFormatter = DateFormatter()

      //  dateFormatter.dateFormat = "YYYY/MM/dd"

        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .short

        // Convert Date to String
       return dateFormatter.string(from: date)
    }
}
