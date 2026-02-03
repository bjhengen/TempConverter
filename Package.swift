// swift-tools-version:5.9
import PackageDescription

let package = Package(
    name: "TempConverter",
    platforms: [.macOS(.v14)],
    targets: [
        .executableTarget(
            name: "TempConverter",
            path: "Sources"
        )
    ]
)
