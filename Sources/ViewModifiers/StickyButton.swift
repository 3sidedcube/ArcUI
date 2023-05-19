//
//  StickyButton.swift
//  ArcUI
//
//  Created by Ben Shutt on 19/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// `View` with sticky button content
public struct StickyButton: ViewModifier {

    /// Button title text
    public var title: String

    /// Style of the button
    public var style: ARCButton.Style

    /// Is the button enabled
    public var isEnabled = true

    /// Is the button loading
    public var isLoading = false

    /// On button tapped
    public var onTap: () -> Void

    public func body(content: Content) -> some View {
        content.modifier(
            StickyBottom {
                ARCButton(title: title, style: style, onTap: onTap)
                    .disabled(!isEnabled)
                    .loading(isLoading)
                    .padding(EdgeInsets.arcStickyContainer)
            }
        )
    }
}

// MARK: - PreviewProvider

struct StickyButton_Previews: PreviewProvider {

    static var previews: some View {
        Text("Test")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .modifier(StickyButton(
                title: "TAP ME!",
                style: .primary,
                onTap: {}
            ))
    }
}
