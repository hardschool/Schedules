// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Schedules",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .library(
            name: "Schedules",
            targets: ["Schedules"]),
    ],
    targets: [
        .target(
            name: "Schedules",
            path: "Schedules/Sources"
        )
    ]
)
