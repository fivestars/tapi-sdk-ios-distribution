// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "TapiSDK",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        .library(name: "TapiSDK", targets: ["TapiSDKTarget"]),
    ], 
    dependencies: [
        .package(url: "https://github.com/Flight-School/AnyCodable", exact: "0.6.7"),
        .package(url: "https://github.com/verygoodsecurity/vgs-collect-ios", exact: "1.16.1"),
    ],
    targets: [
        .target(
            name: "TapiSDKTarget",         // <--- new wrapper
            dependencies: [
                .product(name: "AnyCodable", package: "anycodable"),
                .product(name: "VGSCollectSDK", package: "vgs-collect-ios"),
                .target(name: "TapiSDK")    // <-- reference the actual binary target here
            ],
            publicHeadersPath: ""
        ),
        .binaryTarget(
            name: "TapiSDK",
            path: "TapiSDK.xcframework")
    ]
)
