//
//  ARCButton.swift
//  ArcUI
//
//  Created by Ben Shutt on 19/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

/// Button component
public struct ARCButton: View {

    /// Fixed set of button styles
    public enum Style {

        /// Filled red
        case primary

        /// Stroked blue
        case secondary

        /// Underline blue
        case underline

        /// Disabled state
        case disabled
    }

    @Environment(\.horizontalSizeClass) var horizontalSizeClass
    @Environment(\.isLoading) public var isLoading: Bool
    @Environment(\.isEnabled) public var isEnabled: Bool

    public var title: String
    public var style: Style
    public var onTap: () -> Void
    public var icon: Image?

    /// Mapped `Style` based on states
    private var buttonStyle: Style {
        isLoading || !isEnabled ? .disabled : style
    }

    public init(
        title: String,
        style: Style,
        icon: Image? = nil,
        onTap: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.icon = icon
        self.onTap = onTap
    }

    public var body: some View {
        Button(action: onTap) {
            ZStack {
                HStack(spacing: 0) {
                    if let icon {
                        icon
                            .resizable()
                            .scaledToFit()
                            .frame(size: .ArcButton.iconSize)
                            .padding(.trailing, .ArcButton.iconPadding)
                    }
                    Text(title)
                        .style(style == .underline ? .arcButtonUnderline : .arcButton)
                        .foregroundColor(buttonStyle.textColor)
                        .opacity(isLoading ? 0 : 1)
                }

                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(
                        tint: buttonStyle.textColor
                    ))
                    .opacity(isLoading ? 1 : 0)
            }
            .frame(width: horizontalSizeClass == .compact ? nil : .ArcButton.landscapeWidth)
            .frame(maxWidth: horizontalSizeClass == .compact ? .infinity : nil)
            .padding(.ArcButton.padding)
            .background(buttonStyle.backgroundColor)
            .cornerRadius(.arcCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: .arcCornerRadius)
                    .strokeBorder(buttonStyle.borderColor, lineWidth: .arcBorder)
            )
        }
    }
}

// MARK: - ARCButton.Style

private extension ARCButton.Style {

    var backgroundColor: Color {
        switch self {
        case .primary: return .arcRed
        case .secondary: return .clear
        case .underline: return .clear
        case .disabled: return .arcDarkGray
        }
    }

    var borderColor: Color {
        switch self {
        case .primary: return .clear
        case .secondary: return .arcBlue
        case .underline: return .clear
        case .disabled: return .clear
        }
    }

    var textColor: Color {
        switch self {
        case .primary: return .arcWhite
        case .secondary: return .arcBlue
        case .underline: return .arcBlue
        case .disabled: return .arcWhite
        }
    }
}

// MARK: - PreviewProvider

struct ARCButton_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            ARCButton(title: "PRIMARY", style: .primary, icon: Image.arcPlusIcon, onTap: {})
            ARCButton(title: "PRIMARY LOADING", style: .primary, onTap: {})
                .loading(true)
            ARCButton(title: "PRIMARY DISABLED", style: .primary, onTap: {})
                .disabled(true)

            ARCButton(title: "SECONDARY", style: .secondary, onTap: {})
            ARCButton(title: "SECONDARY LOADING", style: .secondary, onTap: {})
                .loading(true)
            ARCButton(title: "SECONDARY DISABLED", style: .secondary, onTap: {})
                .disabled(true)
            ARCButton(title: "Underline", style: .underline, onTap: {})
        }
        .padding()
//        .previewInterfaceOrientation(.landscapeLeft)
    }
}
