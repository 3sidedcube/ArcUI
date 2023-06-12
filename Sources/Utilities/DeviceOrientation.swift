//
//  DeviceOrientation.swift
//  ArcUI
//
//  Created by Ben Shutt on 12/06/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

#if canImport(UIKit)

import Combine
import SwiftUI

/// Observe device orientation changes
@MainActor public final class DeviceOrientation: ObservableObject {

    /// Shared static singleton.
    ///
    /// Can be observed with:
    /// ```
    /// @ObservedObject private var deviceOrientation: DeviceOrientation = .shared
    /// ```
    public static let shared = DeviceOrientation()

    /// Stored property for whether the device is landscape
    @Published public private(set) var orientation: UIDeviceOrientation

    /// Shorthand for `isPortrait` of `orientation`
    public var isPortrait: Bool {
        orientation.isPortrait
    }

    /// Shorthand for `isLandscape` of `orientation`
    public var isLandscape: Bool {
        orientation.isLandscape
    }

    /// Shorthand for `isFlat` of `orientation`
    public var isFlat: Bool {
        orientation.isFlat
    }

    /// Store publisher cancellables
    private var cancellables = Set<AnyCancellable>()

    public init() {
        orientation = UIDevice.current.orientation
        NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .compactMap { ($0.object as? UIDevice)?.orientation }
            .filter { $0 != .faceUp && $0 != .faceDown }
            .assign(to: \.orientation, on: self)
            .store(in: &cancellables)
    }
}

#endif
