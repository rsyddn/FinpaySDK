//
//  TransferRepository.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 12/01/23.
//

// Delete this After~
// Example:
// https://github.com/rsyddn/SampleAlamoFire/blob/main/SampleAlamoFire/Config/Network/ApiService.swift

import Alamofire
import Foundation

struct TransferRepository {
   public static let shared = TransferRepository()
   
   public func inquiryOthers(username: String, password:String, secretKey: String, transNumber: String, phoneNumber: String,tokenId: String, phoneNumberDest : String,success: @escaping (_ result: TransferOtherInquiry?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
       
       let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
       let mapJson = [
        "requestType" : "trfSesamaInquiry",
        "reqDtime" : DateHelper().getCurrentDate(),
        "transNumber" : transactionNumber,
        "phoneNumber" : phoneNumber,
        "phoneNumberDest" : phoneNumberDest,
        "tokenID" :tokenId]
       
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
           "phoneNumberDest" : phoneNumberDest,
           "tokenID" :tokenId
       ]
       
       ApiService.shared.callAPI(serverURL: Constants.baseUrlCobrand,strURL: Constants.Path.transferOtherInquiry, method: .post, headers: headers, parameters: requestBody, success: { response in
           do {
               if let data = response.data {
                   let result = try JSONDecoder().decode(TransferOtherInquiry.self, from: data)
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

