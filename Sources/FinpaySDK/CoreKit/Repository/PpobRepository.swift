//
//  PpobRepository.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 11/01/23.
//

// Delete this After~
// Example:
// https://github.com/rsyddn/SampleAlamoFire/blob/main/SampleAlamoFire/Config/Network/ApiService.swift

import Alamofire
import Foundation

struct PpobRepository {
    public static let shared = PpobRepository()
    
    public func inquiry(
        username: String,
        password:String,
        secretKey: String,
        transNumber: String,
        phoneNumber: String,
        tokenId: String,
        billingId : String,
        productCode: String,
        billingAmount: String,
        success: @escaping (_ result: PpobInquiry?) -> Void,
        failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "inqBill",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "billingId" : billingId,
            "productCode" : productCode,
            "billingAmount" : billingAmount]
        
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
            "billingId" : billingId,
            "productCode" : productCode,
            "billingAmount" : billingAmount
        ]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.ppobInquiry, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(PpobInquiry.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    public func payment(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String,sof: String,payType: String,denom: String,amount: String, billingId : String, productCode : String, reffFlag : String, activationDate : String, pinToken: String,success: @escaping (_ result: PpobPayment?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "paymentConf",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "sof" : sof,
            "payType" : payType,
            "denom" : denom,
            "amount" : amount,
            "billingId" : billingId,
            "productCode" : productCode,
            "reffFlag" : reffFlag,
            "activationDate" : activationDate,
            "pinToken" : pinToken]
        
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
            "payType" : payType,
            "denom" : denom,
            "amount" : amount,
            "billingId" : billingId,
            "productCode" : productCode,
            "reffFlag" : reffFlag,
            "activationDate" : activationDate,
            "pinToken" : pinToken
        ]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.ppobPayment, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(PpobPayment.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    public func getFeePpob(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String,payType: String,denom: String, billingId : String, productCode : String, success: @escaping (_ result: GetFee?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "getFee",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "phoneNumber" : phoneNumber,
            "tokenID" : tokenId,
            "payType" : payType,
            "billingId" : billingId,
            "productCode" : productCode,
            "denom" : denom
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
            "payType" : payType,
            "billingId" : billingId,
            "productCode" : productCode,
            "denom" : denom
        ]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.getFee, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(GetFee.self, from: data)
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
