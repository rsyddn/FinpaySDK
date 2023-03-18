//
//  QrisPayment.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 02/01/23.
//

import Foundation

class QrisPayment : Codable{
    var statusCode: String?
    var statusDesc: String?
    var bit61: String?
    var bit61Parse: Bit61Parses?
    var syslogno: String?
    var processingTime: Double?
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case bit61 = "bit61"
        case bit61Parse = "bit61Parse"
        case syslogno = "syslogno"
        case processingTime = "processingTime"
    }
}

class Bit61Parses : Codable{
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
    var customerPAN: String?
    var invoice: String?
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
        case customerPAN = "customerPAN"
        case invoice = "invoice"
    }
}
