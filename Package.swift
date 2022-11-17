// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "DiscordGameSDK-Wrapper",
    platforms: [
        .macOS(.v10_14),
    ],
    products: [
        .library(name: "Wrapper", targets: ["Wrapper"]),
        .library(name: "DiscordGameSDK", targets: ["DiscordGameSDK"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
    ],
    targets: [
        .target(name: "Wrapper", dependencies: ["DiscordGameSDK"]),
        .binaryTarget(name: "DiscordGameSDK", path: "DiscordGameSDK.xcframework"),
        .testTarget(name: "WrapperTests", dependencies: ["Wrapper"]),
    ]
)
