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
    dependencies: [],
    targets: [
        .target(
            name: "TapiSDKTarget",
            dependencies: [
                .target(name: "VGSCollectSDK"),
                .target(name: "AnyCodableKit"),
                .target(name: "TapiSDK")
            ],
            publicHeadersPath: ""
        ),
        .binaryTarget(
            name: "TapiSDK",
            path: "TapiSDK.xcframework"),
        .binaryTarget(
            name: "VGSCollectSDK",
            path: "VGSCollectSDK.xcframework"),
        .binaryTarget(
            name: "AnyCodableKit", 
            path: "AnyCodableKit.xcframework")
    ]
)
