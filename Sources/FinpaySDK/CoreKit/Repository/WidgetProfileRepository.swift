//
//  WidgetProfileRepository.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 12/01/23.
//

// Delete this After~
// Example:
// https://github.com/rsyddn/SampleAlamoFire/blob/main/SampleAlamoFire/Config/Network/ApiService.swift

import Alamofire
import Foundation

struct WidgetProfileRepository {
   public static let shared = WidgetProfileRepository()
   
   public func upgradeAccount(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String, success: @escaping (_ result: UpgradeAccount?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
       
       let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
       let mapJson = [
        "requestType" : "getBalance",
        "reqDtime" : DateHelper() .getCurrentDate(),
        "transNumber" : transactionNumber,
        "phoneNumber" : phoneNumber,
        "tokenID" : tokenId
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
           "reqDtime" : DateHelper() .getCurrentDate(),
           "transNumber" : transactionNumber,
           "phoneNumber" : phoneNumber,
           "tokenID" : tokenId
       ]
       
       ApiService.shared.callAPI(serverURL: Constants.baseUrl,strURL: Constants.Path.finpayApiPhp, method: .post, headers: headers, parameters: requestBody, success: { response in
           do {
               if let data = response.data {
                   let result = try JSONDecoder().decode(UpgradeAccount.self, from: data)
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
