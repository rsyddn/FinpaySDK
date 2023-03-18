//
//  SubProduct.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation
struct SubProduct : Codable{
    var statusCode: String?
    var statusDesc: String?
    var dataSubProduct: [DataSubProduct]?
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case dataSubProduct = "data"
    }
}

struct DataSubProduct :Codable{
    var denom:String?
    var provider:String?
    var info:String?
    enum CodingKeys: String, CodingKey{
        case denom = "denom"
        case provider = "provider"
        case info = "info"
    }
}
