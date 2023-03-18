//
//  Voucher.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation
struct Voucher : Codable{
    var image: String
    var name: String
    
    enum CodingKeys: String, CodingKey{
        case image = "image"
        case name = "name"
    }
}
