//
//  PinReset.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 02/01/23.
//

import Foundation

struct PinReset : Codable{
    var statusCode: String?
    var statusDesc: String?
    var processingTime: String?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case processingTime = "processingTime"
    }
}
