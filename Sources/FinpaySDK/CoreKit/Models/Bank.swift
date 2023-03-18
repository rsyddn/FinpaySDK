//
//  Bank.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 30/12/22.
//


import Foundation

struct Bank : Codable{
    var statusCode: String?
    var statusDesc: String?
    var data: [DataBank]?
    var processingTime: String?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case data = "data"
        case processingTime = "processingTime"
    }
}


struct DataBank : Codable{
    var kodeBank: String?
    var bank: String?
    
    enum CodingKeys: String, CodingKey{
        case kodeBank = "kodeBank"
        case bank = "Bank"
    }
}
