// swift-tools-version: 5.6
// The swift-tools-version declares the minimum version of Swift required to build this package.
// 1.5.4
import PackageDescription

let sdkName = "KMLocationSDK"

let binaryUrl = "https://devrepo.kakaomobility.com/repository/LocationCocoaPod/locationsdk-ios/1.105.82/KMLocationSDK.xcframework.zip"
let checksum = "0386bb8ab29be864b18c20658da854ee59dd76b2a7ee851efc7617815c9601b4"

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
        //.package(url: "https://github.com/tjlabs/olympus-sdk-spm", exact: Version(stringLiteral: "0.3.10")),
        //.package(url: "https://github.com/kakaomob/KMLocationSDKXiOS", exact: Version(stringLiteral: "0.1.11")),
        //.package(url: "https://github.com/google/flatbuffers.git", exact: Version(stringLiteral: "25.2.10")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .binaryTarget(name: sdkName, url: binaryUrl, checksum: checksum),
        // TJJupiterSDK's 4 vendored TJLabs frameworks are DYNAMIC libraries: unlike the
        // OlympusSDK/FlatBuffers source pods, they cannot be statically folded into
        // KMLocationSDK.framework — the KMLocationSDK binary carries @rpath load commands
        // for them, so dyld must find them in the host app bundle at launch (missing them
        // aborts launch with "Library not loaded: @rpath/TJLabsAuth.framework/...").
        // Declaring them as binary targets makes SPM link AND embed them into the app
        // automatically. They are referenced-only (never duplicated inside KMLocationSDK),
        // so this does not violate the no-dependency-export rule that keeps the source
        // pods commented out above. The checked-in copies under Frameworks/ must track the
        // TJJupiterSDK pod version pinned in the KMLocationSDK build Podfile (now 2.0.2).
        //.binaryTarget(name: "TJLabsAuth", path: "Frameworks/TJLabsAuth.xcframework"),
        //.binaryTarget(name: "TJLabsCommon", path: "Frameworks/TJLabsCommon.xcframework"),
        //.binaryTarget(name: "TJLabsResource", path: "Frameworks/TJLabsResource.xcframework"),
        //.binaryTarget(name: "TJLabsJupiter", path: "Frameworks/TJLabsJupiter.xcframework"),
        .target(
            name: "\(sdkName)Wrapper",
            dependencies: [
                .target(name: sdkName),
                //.target(name: "TJLabsAuth"),
                //.target(name: "TJLabsCommon"),
                //.target(name: "TJLabsResource"),
                //.target(name: "TJLabsJupiter"),
                //.product(name: "OlympusSDK", package: "olympus-sdk-spm"),
                //.product(name: "KMLocationSDKXiOS", package: "KMLocationSDKXiOS"),
                //.product(name: "FlatBuffers", package: "flatbuffers")
            ]
        )
    ]
)
