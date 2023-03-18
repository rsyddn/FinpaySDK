//
//  DateHelper.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 30/12/22.
//

import Foundation

class DateHelper {
    func getCurrentDate()-> String {
        let date = Date()
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyyMMddHHmmss"
        dateFormatter.locale = Locale.current
        
        let currentDate = dateFormatter.string(from: date)
        return currentDate
    }
}
