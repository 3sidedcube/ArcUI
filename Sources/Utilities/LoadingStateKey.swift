//
//  LoadingStateKey.swift
//  ArcUI
//
//  Created by Ben Shutt on 19/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

private struct LoadingStateKey: EnvironmentKey {

    static let defaultValue = false
}

extension EnvironmentValues {

    var isLoading: Bool {
        get { self[LoadingStateKey.self] }
        set { self[LoadingStateKey.self] = newValue }
    }
}

extension View {

    /// Adds a environment view that controls whether this view is loading.
    /// - Parameter isLoading: Is the component loading
    /// - Returns: `View`
    func loading(_ isLoading: Bool) -> some View {
        environment(\.isLoading, isLoading)
    }
}
