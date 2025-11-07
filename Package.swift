// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
// 1.5.4
import PackageDescription

let sdkName = "KMLocationSDK"

let binaryUrl = "https://devrepo.kakaomobility.com/repository/LocationCocoaPod/locationsdk-ios/1.105.40/KMLocationSDK.xcframework.zip"
let checksum = "a1d2561197c9217610cb4b5b1d5bab21e3c146edb987505e471c5bc098f05b47"

let package = Package(
    name: sdkName,
    platforms: [
        .iOS(.v15)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: sdkName,
            targets: ["\(sdkName)Wrapper"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
//        .package(url: "https://github.com/tjlabs/olympus-sdk-spm", exact: Version(stringLiteral: "0.3.5")),
        .package(url: "https://github.com/google/flatbuffers.git", exact: Version(stringLiteral: "25.2.10")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: sdkName, url: binaryUrl, checksum: checksum),
        .target(name: "\(sdkName)Wrapper",
                dependencies: [.target(name: sdkName),
//                    .product(name: "OlympusSDK", package: "olympus-sdk-spm"),
                               .product(name: "FlatBuffers", package: "flatbuffers")])
    ]
)
