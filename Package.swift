// swift-tools-version: 6.0
import PackageDescription
let package = Package(
    name: "KMLocationSDK",
    platforms: [.iOS(.v15)],
    products: [.library(name: "KMLocationSDK", targets: ["KMLocationSDKWrapper"])],
    targets: [
        .binaryTarget(name: "KMLocationSDK", url: "https://devrepo.kakaomobility.com/repository/LocationCocoaPod/locationsdk-ios/1.5101.6/KMLocationSDK.xcframework.zip", checksum: "768dea8123f19c1b5b43997623a81b0299a4e8c9c4e818a5defcc1a592e80a8e"),
        .binaryTarget(name: "TJLabsAuth", path: "Frameworks/TJLabsAuth.xcframework"),
        .binaryTarget(name: "TJLabsCommon", path: "Frameworks/TJLabsCommon.xcframework"),
        .binaryTarget(name: "TJLabsResource", path: "Frameworks/TJLabsResource.xcframework"),
        .binaryTarget(name: "TJLabsJupiter", path: "Frameworks/TJLabsJupiter.xcframework"),
        .target(name: "KMLocationSDKWrapper", dependencies: ["KMLocationSDK", "TJLabsAuth", "TJLabsCommon", "TJLabsResource", "TJLabsJupiter"])
    ]
)