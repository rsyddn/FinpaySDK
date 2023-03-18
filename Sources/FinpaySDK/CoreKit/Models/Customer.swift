//
//  Customer.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 31/12/22.
//

import Foundation

struct Customer : Codable{
    var statusCode: String?
    var statusDesc: String?
    var custStatusCode: String?
    var custStatusDesc: String?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case custStatusCode = "custStatusCode"
        case custStatusDesc = "custStatusDesc"
    }
}
