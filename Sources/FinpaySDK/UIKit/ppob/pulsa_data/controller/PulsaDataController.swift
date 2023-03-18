import Foundation
import SwiftUI

class PulsaDataController: ObservableObject {
    
    @Published var youremailText: String = ""
    @Published var passwordText: String = ""
    @Published var inquiryResponse: PpobInquiry?
    @Published var isInquiry = false
    
    func inquiry(
        transNumber: String,
        credential: Credential
    ) async {
        await PpobRepository.shared.inquiry(
            username: "",
            password: "",
            secretKey: "",
            transNumber: transNumber,
            phoneNumber: "",
            tokenId: "",
            billingId: "",
            productCode: "",
            billingAmount: "") { result in
                
            } failure: { failureMsg in
                
            }

    }
}
