// swift-tools-version:5.4
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Binary",
    products: [
        .library(name: "Binary", targets: ["Binary"]),
    ],
    dependencies: [
        .package(name: "List", url: "git@github.com:spacenation/swift-list.git", .upToNextMajor(from: "0.3.3")),
    ],
    targets: [
        .target(name: "Binary", dependencies: ["List"]),
        .testTarget(name: "BinaryTests", dependencies: ["Binary"])
    ]
)
