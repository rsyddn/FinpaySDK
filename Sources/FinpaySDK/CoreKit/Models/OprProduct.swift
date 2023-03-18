//
//  GetFee.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 31/12/22.
//

import Foundation

struct OprProduct : Codable{
    var statusCode: String
    var statusDesc: String
    var dataSubProduct : [GroupOpr]
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case dataSubProduct = "data"
    }
}

struct GroupOpr : Codable{
    var denom: String?
    
    enum CodingKeys: String, CodingKey{
        case denom = "groupOpr"
    }
}
