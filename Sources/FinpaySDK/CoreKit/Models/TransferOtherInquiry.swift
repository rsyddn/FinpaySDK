//
//  TransferOtherInquiry.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation
struct TransferOtherInquiry : Codable{
    var statusCode: String?
    var statusDesc: String?
    var billname: String?
    var processingTime: Double?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case billname = "billname"
        case processingTime = "processingTime"
    }
}
