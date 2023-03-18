//
//  ProductRepository.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 11/01/23.
//

// Delete this After~
// Example:
// https://github.com/rsyddn/SampleAlamoFire/blob/main/SampleAlamoFire/Config/Network/ApiService.swift

import Alamofire
import Foundation

struct ProductRepository {
    public static let shared = ProductRepository()
    
    public func getListProduct(username: String, password:String, secretKey: String, transNumber: String, success: @escaping (_ result: Product?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "getProduk",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber]
        
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        
        let requestBody = [
            "requestType" : "mutasiBalance",
            "signatureID" : signatureId,
            "requestType" : "getProduk",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber
        ]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.getListProduct, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(Product.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    public func getListSubProduct(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String, listOpr: [String],success: @escaping (_ result: SubProduct?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson :[String:Any] = [
            "requestType" : "getDenom",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "tokenID" : tokenId,
            "phoneNumber" : phoneNumber,
            "opr" : listOpr]
        
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        
        let requestBody :[String:Any] = [
            "requestType" : "mutasiBalance",
            "signatureID" : signatureId,
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber,
            "tokenID" : tokenId,
            "phoneNumber" : phoneNumber,
            "opr" : listOpr
        ]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.getListSubProduct, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(SubProduct.self, from: data)
                    success(result)
                }
            } catch {
                failure(FailureMessage(error.localizedDescription))
            }

        }, failure: { error in
            failure(FailureMessage(error))
        })
    }
    
    public func getListOprProduct(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String, listOpr: [String],success: @escaping (_ result: OprProduct?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson =  [
            "requestType" : "getProduk",
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber]
        
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        
        let requestBody :[String:Any] = [
            "requestType" : "mutasiBalance",
            "signatureID" : signatureId,
            "reqDtime" : DateHelper().getCurrentDate(),
            "transNumber" : transactionNumber
        ]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.getListOprProduct, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(OprProduct.self, from: data)
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
