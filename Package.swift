// swift-tools-version:4.2
import PackageDescription

let package = Package(
    name: "Fit Me",
    dependencies: [
      .package(url: "https://github.com/danger/swift.git", from: "0.8.0"),
      .package(url: "https://github.com/jpsim/Yams.git", from: "1.0.1")
    ],

    targets: [
        // This is just an arbitrary Swift file in our app, that has
        // no dependencies outside of Foundation, the dependencies section
        // ensures that the library for Danger gets build also.
        .target(name: "fitme", dependencies: ["Danger", "Yams"], path: "Fit Me", sources: ["Stringify.swift"]),
    ]
)
