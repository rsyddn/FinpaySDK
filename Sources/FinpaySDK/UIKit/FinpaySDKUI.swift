//
//  SampleFrameworksUI.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 06/01/23.
//

import Foundation
import SwiftUI

struct FinpaySDKUI {
    public static let shared = FinpaySDKUI()
    
    public func pulsaDataUIBuilder() {
        PulsaDataView()
//        NavigationLink("", destination:  PulsaDataView(), isActive: true)
    }
}
