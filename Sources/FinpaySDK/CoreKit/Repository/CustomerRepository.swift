//
//  CustomerRepository.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 10/01/23.
//

// Delete this After~
// Example:
// https://github.com/rsyddn/SampleAlamoFire/blob/main/SampleAlamoFire/Config/Network/ApiService.swift

import Alamofire
import Foundation

struct CustomerRepository {
    public static let shared = CustomerRepository()
    
    public func reqActivation(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String, tokenId: String, success: @escaping (_ result: Customer?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType": "getToken",
            "reqDtime": DateHelper().getCurrentDate(),
            "transNumber": transactionNumber,
            "phoneNumber": phoneNumber,
            "tokenID": tokenId]
        
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        
        let requestBody = [
            "requestType": "getToken",
            "signature": signatureId,
            "reqDtime": DateHelper().getCurrentDate(),
            "transNumber": transactionNumber,
            "phoneNumber": phoneNumber,
            "tokenID": tokenId]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.reqActivation, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(Customer.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    public func reqConfirmation(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String, tokenId: String, custName: String, otp: String, custStatusCode:String,  success: @escaping (_ result: Customer?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "reqConfirmation",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "custName" : custName,
            "otp" : otp,
            "custStatusCode" : custStatusCode]
        
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        let requestBody = [
            "requestType" : "reqConfirmation",
            "signature": signatureId,
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "custName" : custName,
            "otp" : otp,
            "custStatusCode" : custStatusCode]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.reqConfirmation, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(Customer.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    public func checkProfile(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String, tokenId: String, custName: String, otp: String, custStatusCode:String,  success: @escaping (_ result: Profile?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "checkProfile",
            "reqDtime": DateHelper().getCurrentDate(),
            "transNumber": transactionNumber,
            "phoneNumber": phoneNumber,
            "tokenID": tokenId]
        
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        let requestBody = [
            "requestType" : "checkProfile",
            "signature": signatureId,
            "reqDtime": DateHelper().getCurrentDate(),
            "transNumber": transactionNumber,
            "phoneNumber": phoneNumber,
            "tokenID": tokenId]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.checkProfile, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(Profile.self, from: data)
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
