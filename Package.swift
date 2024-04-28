// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "YMaps",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "YMaps",
            targets: ["YMaps"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(
            url: "https://github.com/c-villain/YandexMapsMobile",
            from: "4.6.1"
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "YMaps",
            dependencies: [
                .product(name: "YandexMapsMobile", package: "YandexMapsMobile")
            ],
            linkerSettings: [ // <===== ‼️LOOK HERE‼️
                .linkedFramework("CoreLocation"),
                .linkedFramework("CoreTelephony"),
                .linkedFramework("SystemConfiguration"),
                .linkedFramework("CoreFoundation"),
                .linkedFramework("Foundation"),
                .linkedFramework("UIKit"),
                .linkedFramework("OpenGLES"),
                .linkedFramework("CoreGraphics"),
                .linkedFramework("QuartzCore"),
                .linkedFramework("Security"),
                .linkedFramework("CoreMotion"),
                .linkedLibrary("resolv"),
                .linkedLibrary("c++"),
                .unsafeFlags(["-ObjC"]),
            ]),
        .testTarget(
            name: "YMapsTests",
            dependencies: ["YMaps"]),
    ]
)
