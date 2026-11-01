// swift-tools-version: 6.4
import PackageDescription

let package = Package(
  name: "Core",
  platforms: [.iOS(.v27), .macOS(.v27)],
  products: [
    .library(name: "Core", targets: ["Core"])
  ],
  targets: [
    .target(
      name: "Core",
      resources: [.copy("Fixtures")]
    ),
    .testTarget(
      name: "CoreTests",
      dependencies: ["Core"]
    ),
  ]
)
