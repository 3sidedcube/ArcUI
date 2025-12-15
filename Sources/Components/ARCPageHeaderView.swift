//
//  ARCPageHeaderView.swift
//  ArcUI
//
//  Created by Neil Japhtha on 23/09/2025.
//  Copyright © 2025 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public struct ARCPageHeaderView<Content: View>: View {
    let backgroundColor: Color
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat
    let content: () -> Content

    public init(
        backgroundColor: Color,
        horizontalPadding: CGFloat,
        verticalPadding: CGFloat,
        content: @escaping () -> Content
    ) {
        self.backgroundColor = backgroundColor
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
        self.content = content
    }

    public var body: some View {
        content()
            .frame(maxWidth: .infinity)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background(
                backgroundColor
            )
    }
}
