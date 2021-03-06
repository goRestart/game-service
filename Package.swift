// swift-tools-version:4.0

import PackageDescription

let package = Package(
  name: "game-service",
  products: [
    .library(name: "App", targets: ["App"]),
    .executable(name: "Run", targets: ["Run"])
  ],
  dependencies: [
    .package(url: "https://github.com/vapor/vapor.git", .upToNextMajor(from: "2.4.0")),
    .package(url: "https://github.com/vapor/fluent-provider.git", .upToNextMajor(from: "1.3.0")),
    .package(url: "https://github.com/vapor-community/postgresql-provider.git", .upToNextMajor(from: "2.1.0")),
    .package(url: "https://github.com/goRestart/core-service.git", .branch("develop")),
    
  ],
  targets: [
    .target(name: "App", dependencies: ["Vapor", "FluentProvider", "PostgreSQLProvider", "CoreService"],
            exclude: [
              "Config",
              "Public",
              "Resources",
              ]),
    .target(name: "Run", dependencies: ["App"]),
    .testTarget(name: "AppTests", dependencies: ["App", "Testing", "CoreTesting", "CoreService"])
  ]
)
