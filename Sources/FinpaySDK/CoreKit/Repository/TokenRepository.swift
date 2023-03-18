//
//  Repository.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 09/01/23.
//

// Delete this After~
// Example:
// https://github.com/rsyddn/SampleAlamoFire/blob/main/SampleAlamoFire/Config/Network/ApiService.swift

import Alamofire
import Foundation

struct TokenRepository {
    public static let shared = TokenRepository()
    
    func getToken(username : String, password: String,transNumber: String, secretKey: String, success: @escaping (_ result: Token?) -> Void, failure: @escaping (_ failureMsg: FailureMessage) -> Void) {
        
        //Create Signature
        let transactionNumber = TransactionHelper().getTransNumber(transNumber: transNumber)
        let mapJson = ["requestType": "getToken", "reqDtime": DateHelper().getCurrentDate(), "transNumber": transactionNumber]
        let signatureId = SignatureHelper().createSignature(data: mapJson, secretKey: secretKey)
        let credentialData = "\(username):\(password)".data(using: String.Encoding.utf8)!
        let base64Credentials = credentialData.base64EncodedString(options: [])
        
        
        var headers = HTTPHeaders()
        headers["Authorization"] = "Basic \(base64Credentials)"
        headers["content-type"] = "application/json"
        
        let requestBody = ["requestType": "getToken","signature": signatureId, "reqDtime": DateHelper().getCurrentDate(), "transNumber": transactionNumber]
        
        ApiService.shared.callAPI(strURL: Constants.Path.getToken, method: .post, headers: headers, parameters: requestBody, success: { response in
            do {
                if let data = response.data {
                    let result = try JSONDecoder().decode(Token.self, from: data)
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
