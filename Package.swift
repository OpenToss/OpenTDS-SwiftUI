// swift-tools-version: 5.5
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OpenTDS",
    platforms: [.iOS(.v14)],
    products: [
        .library(
            name: "OpenTDS",
            targets: ["OpenTDS"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "OpenTDS",
            dependencies: [])
    ]
)
