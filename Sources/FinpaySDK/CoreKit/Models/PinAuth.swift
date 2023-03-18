//
//  PINAuth.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 02/01/23.
//

import Foundation

struct PinAuth : Codable{
    var statusCode: String?
    var statusDesc: String?
    var widgetURL: String?
    var pinToken: String?
    var expiryDtime: String?
    var processingTime: String?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case widgetURL = "widgetURL"
        case pinToken = "pinToken"
        case expiryDtime = "expiryDtime"
        case processingTime = "processingTime"
    }
}
