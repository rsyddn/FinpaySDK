//
//  GetFee.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 31/12/22.
//

import Foundation

struct GetFee : Codable{
    var statusCode: String
    var statusDesc: String
    var data : [DataFee]
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case data = "data"
    }
}

struct DataFee : Codable{
    var sof: String?
    var fee: Int?
    var total: Int?
    
    enum CodingKeys: String, CodingKey{
        case sof = "sof"
        case fee = "fee"
        case total = "total"
    }
}
