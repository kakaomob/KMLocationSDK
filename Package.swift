// swift-tools-version: 6.0
import PackageDescription
let package = Package(
    name: "KMLocationSDK",
    platforms: [.iOS(.v15)],
    products: [.library(name: "KMLocationSDK", targets: ["KMLocationSDKWrapper"])],
    targets: [
        .binaryTarget(name: "KMLocationSDK", url: "https://devrepo.kakaomobility.com/repository/LocationCocoaPod/locationsdk-ios/1.596.4/KMLocationSDK.xcframework.zip", checksum: "2a9c4719927a497718554bc3ad5290008e64defb60f465c96814d38dd9b8d536"),
        .binaryTarget(name: "TJLabsAuth", path: "Frameworks/TJLabsAuth.xcframework"),
        .binaryTarget(name: "TJLabsCommon", path: "Frameworks/TJLabsCommon.xcframework"),
        .binaryTarget(name: "TJLabsResource", path: "Frameworks/TJLabsResource.xcframework"),
        .binaryTarget(name: "TJLabsJupiter", path: "Frameworks/TJLabsJupiter.xcframework"),
        .target(name: "KMLocationSDKWrapper", dependencies: ["KMLocationSDK", "TJLabsAuth", "TJLabsCommon", "TJLabsResource", "TJLabsJupiter"])
    ]
)