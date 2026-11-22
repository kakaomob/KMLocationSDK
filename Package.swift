// swift-tools-version: 6.0
import PackageDescription
let package = Package(
    name: "KMLocationSDK",
    platforms: [.iOS(.v15)],
    products: [.library(name: "KMLocationSDK", targets: ["KMLocationSDKWrapper"])],
    targets: [
        .binaryTarget(name: "KMLocationSDK", url: "https://devrepo.kakaomobility.com/repository/LocationCocoaPod/locationsdk-ios/1.5101.8/KMLocationSDK.xcframework.zip", checksum: "c1781face6b9fb2a2b615024c049ea22bb02ac4cc323bd252e4c0a679e71f9e6"),
        .binaryTarget(name: "TJLabsAuth", path: "Frameworks/TJLabsAuth.xcframework"),
        .binaryTarget(name: "TJLabsCommon", path: "Frameworks/TJLabsCommon.xcframework"),
        .binaryTarget(name: "TJLabsResource", path: "Frameworks/TJLabsResource.xcframework"),
        .binaryTarget(name: "TJLabsJupiter", path: "Frameworks/TJLabsJupiter.xcframework"),
        .target(name: "KMLocationSDKWrapper", dependencies: ["KMLocationSDK", "TJLabsAuth", "TJLabsCommon", "TJLabsResource", "TJLabsJupiter"])
    ]
)