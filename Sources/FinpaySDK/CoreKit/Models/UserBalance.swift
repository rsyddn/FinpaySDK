//
//  UserBallance.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation
struct UserBalance : Codable{
    var statusCode: String?
    var validSIgnature: String?
    var statusDesc: String?
    var custName: String?
    var custType: String?
    var custBalance: String?
    var amount: String?
    var listCard: String?
    var tokenization: String?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case validSIgnature = "validSIgnature"
        case statusDesc = "statusDesc"
        case custName = "custName"
        case custType = "custType"
        case custBalance = "custBalance"
        case amount = "amount"
        case listCard = "listCard"
        case tokenization = "tokenization"
    }
}
