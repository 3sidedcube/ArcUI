//
//  StickyBottom.swift
//  ArcUI
//
//  Created by Ben Shutt on 19/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// `View` with sticky bottom content
public struct StickyBottom<Bottom: View>: ViewModifier {

    /// Make `Bottom` view
    @ViewBuilder public var bottom: () -> Bottom

    public func body(content: Content) -> some View {
        content
            .safeAreaInset(edge: .bottom) {
                bottom()
                    .background(
                        Color.arcWhite
                            .ignoresSafeArea()
                            //.shadow(.button) TODO
                    )
                    .ignoresSafeArea(.keyboard) // Requires container...
            }
    }
}
