// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
// 1.5.4
import PackageDescription

let sdkName = "KMLocationSDK"

let binaryUrl = "https://devrepo.kakaomobility.com/repository/LocationCocoaPod/locationsdk-ios/spm/1.5.1/KMLocationSDK.xcframework.zip"
let checksum = "b2ac3a78d2d77083fe9823b94c26e8c29cbeb549fa13e864a76844566600d98c"

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
        .package(url: "https://github.com/tjlabs/jupiter-sdk-spm", exact: Version(stringLiteral: "3.4.7")),
//        .package(url: "https://github.com/google/flatbuffers.git", exact: Version(stringLiteral: "22.10.26")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: sdkName, url: binaryUrl, checksum: checksum),
        .target(name: "\(sdkName)Wrapper",
                dependencies: [.target(name: sdkName),
                    .product(name: "JupiterSDK", package: "jupiter-sdk-spm"),
                    /*.product(name: "FlatBuffers", package: "flatbuffers")*/])
    ]
)
