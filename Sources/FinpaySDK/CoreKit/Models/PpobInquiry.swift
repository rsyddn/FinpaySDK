//
//  PpobInquiru.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 02/01/23.
//

import Foundation

struct PpobInquiry : Codable{
    var statusCode: String?
    var statusDesc: String?
    var fee: [FeePpob]
    var conf: String?
    var billname: String?
    var bit61: String?
    var bit61Parse: Bit61ParsePpob?
    var tagihan: Int?
    var traxId: String?
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
        case traxId = "traxId"
        case processingTime = "processingTime"
    }
}

struct FeePpob : Codable{
    var sof: String?
    var fee: Int?
    var total: Int?
    
    enum CodingKeys: String, CodingKey{
        case sof = "sof"
        case fee = "fee"
        case total = "total"
    }
}

struct BillInfo1 : Codable {
    var nomorReferensi: String?
    var nilaiTagihan: String?
    var period: String?
    var periodEndDate: String?
    var meterReadDate: String?
    var electricityBill: String?
    var incentive: String?
    var ppn: String?
    var penalty: String?
    var pastMeter: String?
    var presentMeter: String?
    var total: String?
    
    enum CodingKeys: String, CodingKey{
        case nomorReferensi = "nomorReferensi"
        case nilaiTagihan = "nilaiTagihan"
        case period = "period"
        case periodEndDate = "periodEndDate"
        case meterReadDate = "meterReadDate"
        case electricityBill = "electricityBill"
        case incentive = "incentive"
        case ppn = "ppn"
        case penalty = "penalty"
        case pastMeter = "pastMeter"
        case presentMeter = "presentMeter"
        case total = "total"
    }
}

struct Bit61ParsePpob  : Codable{
    var kodeDivre: String?
    var kodeDatel: String?
    var jumlahBill: String?
    var billInfo1: BillInfo1?
    var customerId: String?
    var customerName: String?
    var bill: String?
    var billRef: String?
    var billAmount: String?
    var plnRef : String?
    var swRef : String?
    var meterId : String?
    var subscriberId : String?
    var subscriberSegmen : String?
    var power : String?
    var distCode : Int?
    var upCode : String?
    var upPhone : String?
    var kwhMaximum : String?
    var electricityBill : String?
    var electricityBillTotal : String?
    var feeTotal : String?
    var unsold : String?
    var unsold1 : String?
    var unsold2 : String?
    
    enum CodingKeys: String, CodingKey{
        case kodeDivre = "kodeDivre"
        case kodeDatel = "kodeDatel"
        case jumlahBill = "jumlahBill"
        case billInfo1 = "billInfo1"
        case customerId = "customerId"
        case customerName = "customerName"
        case bill = "bill"
        case billRef = "billRef"
        case billAmount = "billAmount"
        case plnRef = "plnReferenceNumber"
        case swRef = "swReferenceNumber"
        case meterId = "meterId"
        case subscriberId = "subscriberId"
        case subscriberSegmen = "subscriberSegmen"
        case power = "power"
        case distCode = "distCode"
        case upCode = "upCode"
        case upPhone = "upPhone"
        case kwhMaximum = "kwhMaximum"
        case electricityBill = "electricityBill"
        case electricityBillTotal = "electricityBillTotal"
        case feeTotal = "feeTotal"
        case unsold = "unsold"
        case unsold1 = "unsold1"
        case unsold2 = "unsold2"
    }
}
