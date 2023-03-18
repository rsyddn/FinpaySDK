//
//  MutasiBalanceRepository.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 11/01/23.
//

// Delete this After~
// Example:
// https://github.com/rsyddn/SampleAlamoFire/blob/main/SampleAlamoFire/Config/Network/ApiService.swift

import Alamofire
import Foundation

struct MutasiBalanceRepository {
    public static let shared = MutasiBalanceRepository()
    
    public func mutasiBallance(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String, pin : String, custName: String, otp: String, custStatusCode: String, transType: String, transAmount: String, transDesc: String, startDate: String, endDate: String, success: @escaping (_ result: MutasiBallance?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = [
            "requestType" : "mutasiBalance",
            "phoneNumber" : phoneNumber,
            "pin" : pin,
            "reqDtime" : DateHelper().getCurrentDate(),
            "custName" : custName,
            "otp" : otp,
            "custStatusCode" : custStatusCode,
            "transNumber" : transactionNumber,
            "transAmount" : transAmount,
            "transType" : transType,
            "transDesc" : transDesc,
            "startDate" : startDate,
            "endDate" : endDate,
            "tokenID" : tokenId]
        
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        
        let requestBody = [
            "requestType" : "mutasiBalance",
            "phoneNumber" : phoneNumber,
            "pin" : pin,
            "reqDtime" : DateHelper().getCurrentDate(),
            "custName" : custName,
            "otp" : otp,
            "custStatusCode" : custStatusCode,
            "transNumber" : transactionNumber,
            "transAmount" : transAmount,
            "transType" : transType,
            "transDesc" : transDesc,
            "startDate" : startDate,
            "endDate" : endDate,
            "tokenID" : tokenId,
            "signatureID" : signatureId,
        ]
        
        ApiService.shared.callAPI(serverURL: Constants.baseUrl,strURL: Constants.Path.finpayApiPhp, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(MutasiBallance.self, from: data)
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
