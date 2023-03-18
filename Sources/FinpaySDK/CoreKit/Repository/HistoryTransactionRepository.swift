//
//  HistoryTransactionRepository.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 11/01/23.
//

// Delete this After~
// Example:
// https://github.com/rsyddn/SampleAlamoFire/blob/main/SampleAlamoFire/Config/Network/ApiService.swift

import Alamofire
import Foundation

struct HistoryTransactionRepository {
    public static let shared = HistoryTransactionRepository()
    
    public func getHistoryTransaction(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String,startDate: String, endDate: String, success: @escaping (_ result: HistoryTransaction?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "getHist",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "startDate" : startDate,
            "endDate" : endDate]
        
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        
        let requestBody = [
            "requestType" : "getHist",
            "signature": signatureId,
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "startDate" : startDate,
            "endDate" : endDate]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrl,strURL: Constants.Path.finpayApiPhp, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(HistoryTransaction.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    public func getHistoryMasterTransaction(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String,transType: String,startDate: String, endDate: String, success: @escaping (_ result: HistoryTransaction?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "getHistMaster",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "transType" : transType,
            "startDate" : startDate,
            "endDate" : endDate]
        
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        
        let requestBody = [
            "requestType" : "getHist",
            "signature": signatureId,
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "transType" : transType,
            "startDate" : startDate,
            "endDate" : endDate]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrl,strURL: Constants.Path.finpayApiPhp, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(HistoryTransaction.self, from: data)
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
