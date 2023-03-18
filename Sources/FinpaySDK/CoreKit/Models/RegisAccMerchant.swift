//
//  RegisAccMerchant.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation

struct RegisAccMerchant :Codable{
    var statusCode: String?
    var statusDesc: String?
    var transType: String?    
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case transType = "transType"
    }
}
