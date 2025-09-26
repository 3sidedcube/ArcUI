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
    let content: () -> Content
    
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat

    public init(
        backgroundColor: Color,
        content: @escaping () -> Content,
        horizontalPadding: CGFloat,
        verticalPadding: CGFloat
    ) {
        self.backgroundColor = backgroundColor
        self.content = content
        self.horizontalPadding = horizontalPadding
        self.verticalPadding = verticalPadding
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
