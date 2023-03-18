//
//  TransferBankPayment.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation

struct TransferBankPayment :Codable{
    var statusCode: String?
    var statusDesc: String?
    var syslogno: String?
    var fee: FeeBank?
    var bit61Parse: Bit61ParseBank?
    var pajak: PajakBank?
    var processingTime: Double?
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case syslogno = "syslogno"
        case fee = "fee"
        case bit61Parse = "bit61Parse"
        case pajak = "pajak"
        case processingTime = "processingTime"
    }
}

struct Bit61ParseBank :Codable {
    var bankAccName: String?
    var bankName: String?
    var desc: String?
    var category: String?
    var phoneNumberDest: String?
    var bankAccNo: String?
    enum CodingKeys: String, CodingKey{
        case bankAccName = "bankAccName"
        case bankName = "bankName"
        case desc = "desc"
        case category = "category"
        case phoneNumberDest = "phoneNumberDest"
        case bankAccNo = "bankAccNo"
    }
}

struct PajakBank :Codable{
    var amountDpp: Int?
    var amountPpn: Int?
    var ppn: String?
    enum CodingKeys: String, CodingKey{
        case amountDpp = "amountDpp"
        case amountPpn = "amountPpn"
        case ppn = "ppn"
    }
}
