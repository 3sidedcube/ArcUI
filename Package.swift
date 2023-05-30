// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ArcUI",
    platforms: [
        // .macOS(.v12), Uses UIKit
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ArcUI",
            targets: ["ArcUI"]
        )
    ],
    dependencies: [
        .package(
            url: "https://github.com/3sidedcube/cubefoundation-ios.git",
            branch: "feature/system-font"
        )
    ],
    targets: [
        .target(
            name: "ArcUI",
            dependencies: [
                .product(
                    name: "CubeFoundation",
                    package: "cubefoundation-ios"
                ),
                .product(
                    name: "CubeFoundationSwiftUI",
                    package: "cubefoundation-ios"
                )
            ],
            path: "Sources",
            resources: [.process("Resources/ArcMedia.xcasset")]g
        ),
        .testTarget(
            name: "ArcUITests",
            dependencies: ["ArcUI"],
            path: "Tests"
        )
    ]
)
