![OpenTDS](https://raw.githubusercontent.com/Mercen-Lee/OpenTDS/main/Resources/OpenTDSLogo.png)

![Swift](https://img.shields.io/badge/Swift-5.5_5.6_5.7_5.8-Orange?style=flat-square)
![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS-yellowgreen?style=flat-square)
![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)

OpenTDS is Toss Design System Clone for SwiftUI

## Requirements
| Platform | Minimum Swift Version | Installation |
| --- | --- | --- |
| iOS 14.0+ / macOS 10.11+ | 5.5 | [Swift Package Manager](#swift-package-manager) |

## Installation
### Swift Package Manager

Add it to the `dependencies` value of your `Package.swift`.
```swift
dependencies: [
    .package(url: "https://github.com/Mercen-Lee/OpenTDS.git", .branch("main"))
]
```

## Components
### TossTabView
```swift
TossTabView {
    HomeView()
        .tossTabItem("홈", Image(systemName: "house.fill"))
    MyView()
        .tossTabItem("마이", Image(systemName: "person.fill"))
}
```

## Credits
All credit related to the design goes to the [Toss Team](https://toss.im/team).
