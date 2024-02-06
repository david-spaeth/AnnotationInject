// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "AnnotationInject",
    platforms: [
        .macOS(.v10_13)
    ],
    products: [
        .library(
            name: "AnnotationInject",
            targets: ["AnnotationInject"]),
        .executable(name: "annotationinject-cli", targets: ["AnnotationCLI"])
    ],
    dependencies: [
        .package(url: "https://github.com/Swinject/Swinject.git", from: "2.8.0"),
        .package(url: "https://github.com/krzysztofzablocki/Sourcery", from: "2.0.2"),
        .package(url: "https://github.com/Quick/Nimble", from: "10.0.0"),
        .package(url: "https://github.com/Quick/Quick", from: "5.0.0")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "AnnotationInject",
            dependencies: [
                "Swinject",
                .product(name: "SourceryRuntime", package: "Sourcery")
            ],
            path: "Sources"
        ),
        .testTarget(
            name: "AnnotationInjectTests",
            dependencies: ["AnnotationInject", "Quick", "Nimble"],
            path: "Tests"
        ),
        .target(
            name: "AnnotationCLI",
            dependencies: [],
            path: "CLI",
            resources: [
                .copy("Templates"),
                .copy("Scripts"),
                .copy("Sources")
            ]
        )
    ]
)
