//
//  Profile.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 02/01/23.
//

import Foundation

struct Profile : Codable{
    var statusCode: String?
    var statusDesc: String?
    var data: DataProfile?
    var processingTime: Double?
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case data = "data"
        case processingTime = "processingTime"
    }
}

struct History: Codable {
     var trxDTime: String?
     var trxType: String?
     var trxAction: String?
     var trxDesc: String?
     var trxAmount: String?
    enum CodingKeys: String, CodingKey{
        case trxDTime = "trxDTime"
        case trxType = "trxType"
        case trxAction = "trxAction"
        case trxDesc = "trxDesc"
        case trxAmount = "trxAmount"
    }
 }

struct DataProfile : Codable{
    var balance: String?
    var nama: String?
    var email: String?
    var tipeCust: String?
    var evaID: String?
    var lastTrx: String?
    var history: [History]?
    enum CodingKeys: String, CodingKey{
        case balance = "balance"
        case nama = "nama"
        case email = "email"
        case tipeCust = "tipeCust"
        case evaID = "evaID"
        case lastTrx = "lastTrx"
        case history = "history"
    }
}
