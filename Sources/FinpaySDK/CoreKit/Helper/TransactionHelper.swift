//
//  TransactionHelper.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 30/12/22.
//

import Foundation
class TransactionHelper{
    func getTransNumber(transNumber: String)->String {
        var transactionNumber: String = ""
        if (transNumber == "") {
            var uuid = UUID().uuidString
            let regex = try! NSRegularExpression(pattern: "[^A-Za-z0-9]", options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, uuid.count)
            let temp = regex.stringByReplacingMatches(in: uuid, options: [], range: range, withTemplate: "")
            transactionNumber = temp
        } else {
            let regex = try! NSRegularExpression(pattern: "[^A-Za-z0-9]", options: NSRegularExpression.Options.caseInsensitive)
            let range = NSMakeRange(0, transNumber.count)
            let temp = regex.stringByReplacingMatches(in: transNumber, options: [], range: range, withTemplate: "")
            transactionNumber = temp
        }
        return transactionNumber
    }
}
