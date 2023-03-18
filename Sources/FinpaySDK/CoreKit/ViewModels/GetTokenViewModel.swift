//
//  GetTokenViewModels.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 09/01/23.
//

import Foundation

class GetTokenViewModel: ObservableObject {
    
    func getToken(transNumber: String, secretKey: String, username: String, password: String) {
        
        TokenRepository.shared.getToken(username: username, password: password, transNumber: transNumber, secretKey: secretKey) { response in
            if response != nil {
                print(response as Any)
            }
        }
            failure: { error in
               print(error)
            }
    }
}
