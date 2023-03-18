//
//  TopUp.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation
struct Topup :Codable{
    var icon:Int?
    var name:String?
    enum CodingKeys: String, CodingKey{
        case icon = "icon"
        case name = "name"
    }
}
