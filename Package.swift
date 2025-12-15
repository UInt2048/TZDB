// swift-tools-version:5.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let flags = [
    "-DHAS_REMOTE_API=0",
    "-DUSE_SHELL_API",
    "-DAUTO_DOWNLOAD=0",
    "-DUSE_OS_TZDB=1"
]

let package = Package(
    name: "TZDB",
    // TODO: Determine the actual minimum version
    platforms: [
        .macOS(.v10_14),
        .iOS(.v12),
        .tvOS(.v12),
    ],
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "TZDB",
            targets: ["TZDB"]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "TZDB",
            dependencies: [],
            path: "Sources/TZDB",
            publicHeadersPath: "include",
            cSettings: [.unsafeFlags(flags)],
            cxxSettings: [.unsafeFlags(flags)],
            linkerSettings: [.linkedLibrary("z")],
        ),

    ]
)
