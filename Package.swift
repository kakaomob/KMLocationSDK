// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let sdkName = "KMLocationSDK"

let binaryUrl = "https://devrepo.kakaomobility.com/repository/LocationCocoaPod/locationsdk-ios/1.3.61/KMLocationSDK.xcframework.zip"
let checksum = "f9131ea68ae54cd3f78d332e419cc8af0d7816ec8109d7a6233ff7deb60000ec"

let package = Package(
    name: sdkName,
    platforms: [
        .iOS(.v12)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: sdkName,
            targets: ["\(sdkName)Wrapper"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/tjlabs/jupiter-sdk-spm", exact: Version(stringLiteral: "3.0.8")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: sdkName, url: binaryUrl, checksum: checksum),
        .target(name: "\(sdkName)Wrapper",
                dependencies: [.target(name: sdkName), .product(name: "JupiterSDK", package: "jupiter-sdk-spm")])
    ]
)
