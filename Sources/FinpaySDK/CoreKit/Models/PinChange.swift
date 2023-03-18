//
//  PinChange.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 02/01/23.
//

import Foundation

struct PinChange : Codable{
    var statusCode: String?
    var statusDesc: String?
    var widgetURL: String?
    var processingTime: String?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case widgetURL = "widgetURL"
        case processingTime = "processingTime"
    }
}
