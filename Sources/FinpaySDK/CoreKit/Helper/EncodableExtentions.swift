//
//  EncodableExtentions.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 11/01/23.
//

import Foundation

// Converts encodable structure to dictionary.
extension Encodable {
    var dictionary: [String: Any]? {
        guard let data = try? JSONEncoder().encode(self) else { return nil }
        return (try? JSONSerialization.jsonObject(with: data, options: .allowFragments)).flatMap { $0 as? [String: Any] }
    }
}
