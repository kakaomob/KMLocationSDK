// swift-tools-version: 6.0
import PackageDescription
let package = Package(
    name: "KMLocationSDK",
    platforms: [.iOS(.v15)],
    products: [.library(name: "KMLocationSDK", targets: ["KMLocationSDKWrapper"])],
    targets: [
        .binaryTarget(name: "KMLocationSDK", url: "https://devrepo.kakaomobility.com/repository/LocationCocoaPod/locationsdk-ios/1.5101.1/KMLocationSDK.xcframework.zip", checksum: "9e31b0befccbe7138469ee51039d0b83fc04dc343908049e4b54504e6e00429c"),
        .binaryTarget(name: "TJLabsAuth", path: "Frameworks/TJLabsAuth.xcframework"),
        .binaryTarget(name: "TJLabsCommon", path: "Frameworks/TJLabsCommon.xcframework"),
        .binaryTarget(name: "TJLabsResource", path: "Frameworks/TJLabsResource.xcframework"),
        .binaryTarget(name: "TJLabsJupiter", path: "Frameworks/TJLabsJupiter.xcframework"),
        .target(name: "KMLocationSDKWrapper", dependencies: ["KMLocationSDK", "TJLabsAuth", "TJLabsCommon", "TJLabsResource", "TJLabsJupiter"])
    ]
)