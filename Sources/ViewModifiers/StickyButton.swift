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

    @Environment(\.verticalSizeClass) var verticalSizeClass

    public var title: String
    public var style: ARCButton.Style
    public var isEnabled: Bool
    public var isLoading: Bool
    public var onTap: () -> Void

    /// Public memberwise initializer
    public init(
        title: String,
        style: ARCButton.Style,
        isEnabled: Bool = true,
        isLoading: Bool = false,
        onTap: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.isEnabled = isEnabled
        self.isLoading = isLoading
        self.onTap = onTap
    }

    public func body(content: Content) -> some View {
        content.modifier(
            StickyBottom {
                ARCButton(title: title, style: style, onTap: onTap)
                    .disabled(!isEnabled)
                    .loading(isLoading)
                    .frame(maxWidth: verticalSizeClass == .regular ? nil : .infinity)
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
            .previewInterfaceOrientation(.landscapeLeft)
    }
}
