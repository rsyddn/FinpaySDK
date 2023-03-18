//
//  Constants.swift
//  SampleFrameworks
//
//  Created by Muhammad Rasyiddin on 09/01/23.
//

import Foundation

struct Constants {
    static let baseUrl: String = "https://demos.finnet.co.id/emondev/"
    static let baseUrlCobrand : String = "https://demos.finnet.co.id/apicobrand/"

    enum Path {
        static let getToken: String = "security/getToken"
        static let reqActivation: String = "customer/activation"
        static let reqConfirmation : String = "customer/confirmation"
        static let finpayApiPhp: String = "api.php"
        static let getListProduct: String = "content/produk/"
        static let getListSubProduct : String = "getDenom/"
        static let getListOprProduct: String = "content/produk/{product_code}"
        static let getFee: String = "getFee"
        static let getUserBalance : String = "checkProfile/cekSaldo"
        static let upgradeAccount: String = "upgradeAccount"
        static let qrisInquiry: String = "qris/Inquiry"
        static let qrisPayment: String = "qris/Payment"
        static let ppobInquiry: String = "inqBill"
        static let ppobPayment: String = "paymentConf"
        static let authPin: String = "security/pin/auth"
        static let transferOtherInquiry : String = "transfer/sesama/inquiry"
        static let transferBankInquiry: String = "transfer/bank/inquiry"
        static let transferOtherPayment: String = "transfer/sesama/payment"
        static let transferBankPayment: String = "transfer/bank/payment"
        static let getListBank: String = "content/bank"
        static let resetPin: String =  "security/pin/reset"
        static let changePin: String = "security/pin/change/widget"
        static let topup: String = "widget/api/topup"
        static let checkProfile: String = "checkProfile/"
    }
}
