// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "FinpaySDK",
    platforms: [.iOS(.v16), .macOS(.v13)],
    products: [
        .library(
            name: "FinpaySDK",
            targets: ["FinpaySDK"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Alamofire/Alamofire.git", .upToNextMajor(from: "5.6.1")),
    ],
    targets: [
        .target(
            name: "FinpaySDK",
            dependencies: ["Alamofire"]),
    ],
    swiftLanguageVersions: [.v5]
)
