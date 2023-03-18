//
//  PinRepository.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 11/01/23.
//

// Delete this After~
// Example:
// https://github.com/rsyddn/SampleAlamoFire/blob/main/SampleAlamoFire/Config/Network/ApiService.swift

import Alamofire
import Foundation

struct PinRepository {
    public static let shared = PinRepository ()
    
    public func authPin(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String, amount : String, productCode: String, success: @escaping (_ result: PinAuth?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "authPin",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "amount" : amount,
            "productCode" : productCode]
        
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
            "amount" : amount,
            "productCode" : productCode
        ]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.authPin, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(PinAuth.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    public func resetPin(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String, deviceId : String,  success: @escaping (_ result: PinReset?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "resetPin",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "deviceId" : deviceId]
        
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
            "deviceId" : deviceId
        ]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.resetPin, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(PinReset.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    public func changePin(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String, deviceId : String,  success: @escaping (_ result: PinChange?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "widgetChangePin",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId]
        
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
            "tokenID" : tokenId
        ]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.changePin, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(PinChange.self, from: data)
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
