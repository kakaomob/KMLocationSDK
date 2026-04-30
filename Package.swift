// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
// 1.5.4
import PackageDescription

let sdkName = "KMLocationSDK"

let binaryUrl = "https://devrepo.kakaomobility.com/repository/LocationCocoaPod/locationsdk-ios/1.5.62/KMLocationSDK.xcframework.zip"
let checksum = "1c8d6735f32c834f489c296c5b0832de5bc35e2878b64dff439c53b259ebf4f7"

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
        .package(url: "https://github.com/tjlabs/olympus-sdk-spm", exact: Version(stringLiteral: "0.3.9")),
        .package(url: "https://github.com/kakaomob/KMLocationSDKXiOS", exact: Version(stringLiteral: "0.1.11")),
        .package(url: "https://github.com/google/flatbuffers.git", exact: Version(stringLiteral: "25.2.10")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: sdkName, url: binaryUrl, checksum: checksum),
        .target(name: "\(sdkName)Wrapper",
                dependencies: [.target(name: sdkName),
                    .product(name: "OlympusSDK", package: "olympus-sdk-spm"),
                    .product(name: "KMLocationSDKXiOS", package: "KMLocationSDKXiOS"),
                               .product(name: "FlatBuffers", package: "flatbuffers")])
    ]
)
