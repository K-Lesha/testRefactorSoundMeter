// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "LitePayt",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "LitePayt",
            targets: ["LitePayt"]),
    ],

    dependencies: [
        //.package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "11.5.0"),
        .package(url: "https://github.com/apphud/ApphudSDK",   exact: "3.3.6"),
        .package(url: "https://github.com/relatedcode/ProgressHUD",   exact: "14.1.3"),
        //.package(url: "https://github.com/firebase/firebase-ios-sdk", from: "10.26.0"),
        
       
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "LitePayt",
            dependencies: [
                //.product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .product(name: "ApphudSDK", package: "ApphudSDK"),
                .product(name: "ProgressHUD", package: "ProgressHUD"),
                //.product(name: "FirebaseAnalytics", package: "firebase-ios-sdk")
            ]
        )

    ],
    swiftLanguageVersions: [.v5]
)
