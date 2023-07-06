![OpenTDS](https://raw.githubusercontent.com/Mercen-Lee/OpenTDS/main/Resources/OpenTDSLogoDark.png#gh-dark-mode-only)
![OpenTDS](https://raw.githubusercontent.com/Mercen-Lee/OpenTDS/main/Resources/OpenTDSLogoLight.png#gh-light-mode-only)

![Swift](https://img.shields.io/badge/Swift-5.5_5.6_5.7_5.8-Orange?style=flat-square)
![Platforms](https://img.shields.io/badge/Platforms-macOS_iOS-yellowgreen?style=flat-square)
![Swift Package Manager](https://img.shields.io/badge/Swift_Package_Manager-compatible-orange?style=flat-square)

OpenTDS is Toss Design System Clone for SwiftUI.

## Requirements
| Platform | Minimum Swift Version | Installation |
| --- | --- | --- |
| iOS 14.0+ / macOS 10.11+ | 5.5 | [Swift Package Manager](#swift-package-manager) |

## Disclaimer
This package is unfinished and not ready for deployment.

## Installation
### Swift Package Manager
- `File` -> `Add Packages...` And paste the repository URL.
- Or add it to the `dependencies` value of your `Package.swift`.
```swift
dependencies: [
    .package(url: "https://github.com/Mercen-Lee/OpenTDS.git", .branch("main"))
]
```

## Components
- [TossTabView](#tosstabview)
- [TossTabViewButton](#tosstabviewbutton)
  
## Examples
### TossTabView
> Animated Tab View of Toss.
- The number of Views must be between 2 and 5.
- Every single View should have `.tossTabItem` Modifier.
```swift
TossTabView {
    HomeView()
        .tossTabItem("Home", Image(systemName: "house.fill"))
    MyView()
        .tossTabItem("My", Image(systemName: "person.fill"))
}
```

### TossTabViewButton
> Animated Tab View Button of Toss.
- It exists for TossTabView.
```swift
TossTabViewButton("Home", Image(systemName: "house.fill"), true) {
    anyMethod()
}
```

## Credits
All credit related to the design goes to the [Toss Team](https://toss.im/team).
