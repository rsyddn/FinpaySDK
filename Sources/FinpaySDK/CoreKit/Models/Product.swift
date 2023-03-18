//
//  Product.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 02/01/23.
//

import Foundation

struct Product : Codable{
    var statusCode: String?
    var statusDesc: String?
    var dataProduct: [DetailProductModel]?
    enum CodingKeys: String, CodingKey{
        case statusCode = "statusCode"
        case statusDesc = "statusDesc"
        case dataProduct = "data"
    }
}

struct DetailProductModel : Codable{
    var productCode: String?
    var productDesc: String?
    enum CodingKeys: String, CodingKey{
        case productCode = "productCode"
        case productDesc = "productDesc"
    }
}
