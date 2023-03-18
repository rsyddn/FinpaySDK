//
//  TransferBankInquiry.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation
struct TransferBankInquiry : Codable{
    var statusCode: String?
    var statusDesc: String?
    var billname: String?
    var fee: [FeeBank]?
    var conf: String?
    var reffTrx: String?
    var processingTime: Double?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case billname = "billname"
        case fee = "fee"
        case conf = "conf"
        case reffTrx = "reffTrx"
        case processingTime = "processingTime"
    }
}

struct FeeBank : Codable{
    var sof: String?
    var fee: Int?
    var total: Int?
    enum CodingKeys: String, CodingKey{
        case sof = "sof"
        case fee = "fee"
        case total = "total"
    }
}
