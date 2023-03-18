//
//  Transactio.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation

struct Transaction : Codable {
    var statusCode: String?
    var statusDesc: String?
    var appCode: String?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case appCode = "appCode"
    }
}
