// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "TreeSitterSqlite",
    products: [
        .library(name: "TreeSitterSqlite", targets: ["TreeSitterSqlite"]),
    ],
    dependencies: [
        .package(url: "https://github.com/ChimeHQ/SwiftTreeSitter", from: "0.8.0"),
    ],
    targets: [
        .target(
            name: "TreeSitterSqlite",
            dependencies: [],
            path: ".",
            sources: [
                "src/parser.c",
                // NOTE: if your language has an external scanner, add it here.
            ],
            resources: [
                .copy("queries")
            ],
            publicHeadersPath: "bindings/swift",
            cSettings: [.headerSearchPath("src")]
        ),
        .testTarget(
            name: "TreeSitterSqliteTests",
            dependencies: [
                "SwiftTreeSitter",
                "TreeSitterSqlite",
            ],
            path: "bindings/swift/TreeSitterSqliteTests"
        )
    ],
    cLanguageStandard: .c11
)
