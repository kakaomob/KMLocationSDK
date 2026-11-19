// swift-tools-version: 6.0
import PackageDescription
let package = Package(
    name: "KMLocationSDK",
    platforms: [.iOS(.v15)],
    products: [.library(name: "KMLocationSDK", targets: ["KMLocationSDKWrapper"])],
    targets: [
        .binaryTarget(name: "KMLocationSDK", url: "https://devrepo.kakaomobility.com/repository/LocationCocoaPod/locationsdk-ios/1.5101.3/KMLocationSDK.xcframework.zip", checksum: "3b741621c2142396c523548118cbb38adc2d654d56457d10b694411905ce25dd"),
        .binaryTarget(name: "TJLabsAuth", path: "Frameworks/TJLabsAuth.xcframework"),
        .binaryTarget(name: "TJLabsCommon", path: "Frameworks/TJLabsCommon.xcframework"),
        .binaryTarget(name: "TJLabsResource", path: "Frameworks/TJLabsResource.xcframework"),
        .binaryTarget(name: "TJLabsJupiter", path: "Frameworks/TJLabsJupiter.xcframework"),
        .target(name: "KMLocationSDKWrapper", dependencies: ["KMLocationSDK", "TJLabsAuth", "TJLabsCommon", "TJLabsResource", "TJLabsJupiter"])
    ]
)