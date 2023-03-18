//
//  ReqConfirmation.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation
struct ReqConfirmation :Codable{
    var statusCode: String?
    var statusDesc: String?
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
    }
}
