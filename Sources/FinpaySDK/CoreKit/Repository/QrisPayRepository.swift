//
//  QrisPayRepository.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 11/01/23.
//

// Delete this After~
// Example:
// https://github.com/rsyddn/SampleAlamoFire/blob/main/SampleAlamoFire/Config/Network/ApiService.swift

import Alamofire
import Foundation

struct QrisPayRepository {
    public static let shared = QrisPayRepository()
    
    public func inquiry(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String, stringQris : String, success: @escaping (_ result: QrisInquiry?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "inquiryQris",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "stringQris" : stringQris]
        
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        
        let requestBody = [
            "requestType" : "mutasiBalance",
            "signatureID" : signatureId,
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "stringQris" : stringQris
        ]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.qrisInquiry, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(QrisInquiry.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    public func payment(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String, sof : String,amount : String,amountTips : String,reffFlag : String,pinToken : String, success: @escaping (_ result: QrisPayment?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "inquiryQris",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "sof" : sof,
            "amount" : amount,
            "amountTips" : amountTips,
            "reffFlag" : reffFlag,
            "pinToken" : pinToken
        ]
        
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        
        let requestBody = [
            "requestType" : "mutasiBalance",
            "signatureID" : signatureId,
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "sof" : sof,
            "amount" : amount,
            "amountTips" : amountTips,
            "reffFlag" : reffFlag,
            "pinToken" : pinToken
        ]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.qrisPayment, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(QrisPayment.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
}
