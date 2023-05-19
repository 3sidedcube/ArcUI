# ArcUI

UI components for the American Red Cross (ARC) apps written in SwiftUI.

## Installation

Add the following as a package dependency in Xcode

```
 https://github.com/3sidedcube/ArcUI.git 
```
 
or, in your `Package.swift`, add:

```swift
...
dependencies: [
    .package(
        url: "https://github.com/3sidedcube/ArcUI.git",
        branch: "develop"
    )
],
...
targets: [
    .target(
        name: "{YourApp}",
        dependencies: ["ArcUI"]
    )
]
```
