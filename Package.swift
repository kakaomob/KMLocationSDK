// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let sdkName = "KMLocationSDK"

let binaryUrl = "https://devrepo.kakaomobility.com/repository/LocationCocoaPod/locationsdk-ios/1.104.2/KMLocationSDK.xcframework.zip"
let checksum = "55969d97f4e49fdb411a8540f92d241ecbad342b277c8a4d61f31bd3fa70b20d"

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
//        .package(url: "https://github.com/tjlabs/jupiter-sdk-spm", exact: Version(stringLiteral: "3.4.3")),
        .package(url: "https://github.com/google/flatbuffers.git", exact: Version(stringLiteral: "22.10.26"))
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: sdkName, url: binaryUrl, checksum: checksum),
        .target(name: "\(sdkName)Wrapper",
                dependencies: [.target(name: sdkName), /*.product(name: "JupiterSDK", package: "jupiter-sdk-spm"),*/ .product(name: "FlatBuffers", package: "flatbuffers")])
    ]
)
