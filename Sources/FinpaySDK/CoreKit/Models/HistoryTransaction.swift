//
//  HistoryTransaction.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 31/12/22.
//

import Foundation

struct HistoryTransaction : Codable{
    var statusCode: String
    var statusDesc: String
    var data : [DataHistoryTransaction]
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case data = "detailHist"
    }
}

struct DataHistoryTransaction : Codable{
        var dateTime: String?
        var type: String?
        var desc: String?
        var value: String?
        var trxCode: String?
        var id: String?
        var sumIn: String?
        var sumOut: String?
        var sysLogno: String?
        var channelId: String?
        var source: String?
        var destination: String?
        var name: String?
        var traxId: String?
        var prodCode: String?
        var billingNo: String?
        var sofCode: String?
        var sofId: String?
    
    enum CodingKeys: String, CodingKey{
        case dateTime  = "tanggal"
        case type = "type"
        case desc = "desc"
        case value = "value"
        case trxCode = "trxcode"
        case id = "id"
        case sumIn = "sum_in"
        case sumOut = "sum_out"
        case sysLogno = "syslogno"
        case channelId = "channel_id"
        case source = "source"
        case destination = "destination"
        case name = "name"
        case traxId = "traxId"
        case prodCode = "prodCode"
        case billingNo = "billingNo"
        case sofCode = "sofCode"
        case sofId = "sofId"
    }
}
