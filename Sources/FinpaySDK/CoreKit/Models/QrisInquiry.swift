//
//  QrisInquiry.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 02/01/23.
//

import Foundation

struct QrisInquiry : Codable{
    var statusCode: String?
    var statusDesc: String?
    var fee: [Fee]?
    var conf: String?
    var billname: String?
    var bit61: String?
    var bit61Parse: Bit61Parse?
    var tagihan: Int?
    var processingTime: Double?
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case fee = "fee"
        case conf = "conf"
        case billname = "billname"
        case bit61 = "bit61"
        case bit61Parse = "bit61Parse"
        case tagihan = "tagihan"
        case processingTime = "processingTime"
    }
}

struct Fee : Codable{
    var sof: String?
    var fee: Int?
    var total: Int?
    enum CodingKeys: String, CodingKey{
        case sof = "sof"
        case fee = "fee"
        case total = "total"
    }
}

struct Bit61Parse : Codable{
    var merchantName: String?
    var merchantId: String?
    var nevaNumber: String?
    var amount: String?
    var paymentCode: String?
    var pointOfMethod: String?
    var tipsType: String?
    var tipsAmount: String?
    var tipsPercentage: String?
    var acquirerName: String?
    var merchantLocation: String?
    var merchantPAN: String?
    var terminalID: String?
    var isOnUs: String?
    enum CodingKeys: String, CodingKey{
        case merchantName = "merchantName"
        case merchantId = "merchantId"
        case nevaNumber = "nevaNumber"
        case amount = "amount"
        case paymentCode = "paymentCode"
        case pointOfMethod = "pointOfMethod"
        case tipsType = "tipsType"
        case tipsAmount = "tipsAmount"
        case tipsPercentage = "tipsPercentage"
        case acquirerName = "acquirerName"
        case merchantLocation = "merchantLocation"
        case merchantPAN = "merchantPAN"
        case terminalID = "terminalID"
        case isOnUs = "isOnUs"
    }
}
