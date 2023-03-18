//
//  WidgetProfile.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation
struct WidgetProfile : Codable {
    var statusCode: String?
    var statusDesc: String?
    var widgetURL: String?
    
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case widgetURL = "widgetURL"
    }
}
