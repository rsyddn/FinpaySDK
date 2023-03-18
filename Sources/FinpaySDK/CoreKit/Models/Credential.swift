//
//  Credentiaal.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 31/12/22.
//

import Foundation

struct Credential{
    var username: String?
    var password: String?
    var secretKey: String?
    var phoneNumber: String?
    var custName: String?
    var otp: String?
    
    enum CodeKeys : String, Codable{
        case username = "username"
        case password = "password"
        case secretKey = "secretKey"
        case phoneNumber = "phoneNumber"
        case custName = "custName"
        case otp = "otp"
    }
}
