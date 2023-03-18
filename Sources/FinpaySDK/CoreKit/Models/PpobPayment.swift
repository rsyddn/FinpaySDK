//
//  PpobPayment.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 02/01/23.
//

import Foundation

struct PpobPayment :Codable {
    var statusCode: String?
    var statusDesc: String?
    var bit61: String?
    var bit61Parse: Bit61ParsePaymentPpob?
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

struct Pajak :Codable{
    var amountDpp: Int?
    var amountPpn: Int?
    var ppn: String?
    
    enum CodingKeys: String, CodingKey{
        case amountDpp = "amountDpp"
        case amountPpn = "amountPpn"
        case ppn = "ppn"
    }
}

struct BillInfo1PaymentPpob :Codable{
    var nomorReferensi: String?
    var nilaiTagihan: String?
    
    enum CodingKeys: String, CodingKey{
        case nomorReferensi = "nomorReferensi"
        case nilaiTagihan = "nilaiTagihan"
    }
}

struct Bit61ParsePaymentPpob:Codable {
    var kodeDivre: String?
    var kodeDatel: String?
    var jumlahBill: String?
    var billInfo1: BillInfo1PaymentPpob?
    var customerId: String?
    var customerName: String?
    var npwp: String?
    
    enum CodingKeys: String, CodingKey{
        case kodeDivre = "kodeDivre"
        case kodeDatel = "kodeDatel"
        case jumlahBill = "jumlahBill"
        case billInfo1 = "billInfo1"
        case customerId = "customerId"
        case customerName = "customerName"
        case npwp = "npwp"
    }
}
