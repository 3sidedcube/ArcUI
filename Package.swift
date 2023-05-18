// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ArcUI",
    platforms: [
        .macOS(.v12),
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "ArcUI",
            targets: ["ArcUI"]
        )
    ],
    targets: [
        .target(
            name: "ArcUI",
            path: "Sources"
        ),
        .testTarget(
            name: "ArcUITests",
            dependencies: ["ArcUI"],
            path: "Tests"
        )
    ]
)
