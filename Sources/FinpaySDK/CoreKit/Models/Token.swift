//
//  Token.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 30/12/22.
//

import Foundation

struct Token : Codable{
    var statusCode: String?
    var statusDesc: String?
    var tokenId: String?
    var tokenExpirity: String?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case tokenId = "tokenID"
        case tokenExpirity = "tokenExpiry"
    }
}
