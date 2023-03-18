//
//  Unpair.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation
struct Unpair : Codable{
    var statusCode: String?
    var statusDesc: String?
    var unpairStatus: String?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case unpairStatus = "syslogno"
    }
}
