//
//  ARCPageHeaderView.swift
//  ArcUI
//
//  Created by Neil Japhtha on 23/09/2025.
//  Copyright © 2025 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct ARCPageHeaderView<Content: View>: View {
    @Environment(\.verticalSizeClass) var verticalSizeClass

    let backgroundColor: Color
    let content: () -> Content
    
    let horizontalPadding: CGFloat
    let verticalPadding: CGFloat

    var body: some View {
        content()
            .frame(maxWidth: .infinity)
            .padding(.horizontal, horizontalPadding)
            .padding(.vertical, verticalPadding)
            .background(
                backgroundColor
            )
    }
}
