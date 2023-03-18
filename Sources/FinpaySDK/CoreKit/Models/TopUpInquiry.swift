//
//  TopUpInquiry.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation
struct TopupInquiry : Codable{
    var statusCode: String?
    var statusDesc: String?
    var paymentCode: String?
    var expiryDtime: String?
    var guidence: Guidence?
    var processingTime: Double?
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case paymentCode = "payment_code"
        case expiryDtime = "expiryDtime"
        case guidence = "guidence"
        case processingTime = "processingTime"
    }
}

struct Vabni : Codable {
    var atm: [String]?
    var mbanking: [String]?
    var ibanking: [String]?
    enum CodingKeys: String, CodingKey{
        case atm = "atm"
        case mbanking = "mbanking"
        case ibanking = "ibanking"
    }
}

struct Guidence :Codable{
    var vabni: Vabni?
    enum CodingKeys: String, CodingKey{
        case vabni = "vabni"
    }
}
