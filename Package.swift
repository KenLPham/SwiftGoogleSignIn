// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGoogleSignIn",
    defaultLocalization: "en",
    platforms: [
        .macOS(.v10_11),
        .iOS(.v9),
        .tvOS(.v9),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "GoogleSignIn",
            targets: [ "SwiftGoogleSignIn" ]
        )
    ],
    dependencies: [
        .package(
            name: "GTMSessionFetcher",
            url: "https://github.com/google/gtm-session-fetcher.git",
            "1.4.0" ..< "2.0.0"
        ),
        .package(
            name: "GTMAppAuth",
            url: "https://github.com/sugarpac/GTMAppAuth.git",
            .branch("master")
        ),
        .package(
            name: "AppAuth",
            url: "https://github.com/openid/AppAuth-iOS.git",
            "1.4.0" ..< "2.0.0"
        )
    ],
    targets: [
        .target(
            name: "SwiftGoogleSignIn",
            dependencies: [
                "AppAuth",
                .product(name: "GTMSessionFetcherCore", package: "GTMSessionFetcher"),
                .product(name: "GTMAppAuth", package: "GTMAppAuth"),
                .target(name: "GoogleSignInBinary", condition: .when(platforms: .some([ .iOS ])))
            ],
            resources: [ .process("Resources") ]
        ),
        .binaryTarget(
            name: "GoogleSignInBinary",
            path: "artifacts/GoogleSignIn.xcframework"
        )
    ]
)
