//
//  PDAMRegion.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 02/01/23.
//

import Foundation

struct PDAMRegion : Codable{
    var name: String?
    var code: String?
    
    enum CodingKeys: String, CodingKey{
        case name = "name"
        case code = "code"
    }
}
