//
//  DeviceOrientation.swift
//  ArcUI
//
//  Created by Ben Shutt on 12/06/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

#if canImport(UIKit)

import UIKit
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
    @Published public private(set) var isLandscape: Bool

    /// Store publisher cancellables
    private var cancellables = Set<AnyCancellable>()

    public init() {
        isLandscape = UIDevice.current.orientation.isLandscape
        NotificationCenter.default.publisher(for: UIDevice.orientationDidChangeNotification)
            .compactMap { ($0.object as? UIDevice)?.orientation.isLandscape }
            .assign(to: \.isLandscape, on: self)
            .store(in: &cancellables)
    }
}

#endif
