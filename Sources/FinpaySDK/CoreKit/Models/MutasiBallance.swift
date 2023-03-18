//
//  MutasiBallance.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 02/01/23.
//

import Foundation

struct MutasiBallance : Codable{
    var statusCode: String
    var statusDesc: String
    var appCode : String
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case appCode = "appCode"
    }
}
