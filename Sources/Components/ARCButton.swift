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

        /// Disabled state
        case disabled
    }

    @Environment(\.isLoading) public var isLoading: Bool
    @Environment(\.isEnabled) public var isEnabled: Bool

    public var title: String
    public var style: Style
    public var onTap: () -> Void

    /// Mapped `Style` based on states
    private var buttonStyle: Style {
        isLoading || !isEnabled ? .disabled : style
    }

    public var body: some View {
        Button(action: onTap) {
            ZStack {
                Text(title)
                    .style(.arcButton)
                    .foregroundColor(buttonStyle.textColor)
                    .opacity(isLoading ? 0 : 1)

                ProgressView()
                    .progressViewStyle(CircularProgressViewStyle(
                        tint: buttonStyle.textColor
                    ))
                    .opacity(isLoading ? 1 : 0)
            }
            .frame(maxWidth: .infinity)
            .padding(.vertical, .arcButtonPadding)
            .background(buttonStyle.backgroundColor)
            .cornerRadius(.arcButtonCorner)
            .overlay(
                RoundedRectangle(cornerRadius: .arcButtonCorner)
                    .strokeBorder(buttonStyle.borderColor, lineWidth: .arcButtonBorder)
            )
        }
    }
}

// MARK: - ARCButton.Style

private extension ARCButton.Style {

    var backgroundColor: Color {
        switch self  {
        case .primary: return .arcRed
        case .secondary: return .clear
        case .disabled: return .arcDarkGray
        }
    }

    var borderColor: Color {
        switch self  {
        case .primary: return .clear
        case .secondary: return .arcBlue
        case .disabled: return .clear
        }
    }

    var textColor: Color {
        switch self  {
        case .primary: return .arcWhite
        case .secondary: return .arcBlue
        case .disabled: return .arcWhite
        }
    }
}

// MARK: - PreviewProvider

struct ARCButton_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            ARCButton(title: "PRIMARY", style: .primary, onTap: {})
            ARCButton(title: "PRIMARY LOADING", style: .primary, onTap: {})
                .loading(true)
            ARCButton(title: "PRIMARY DISABLED", style: .primary, onTap: {})
                .disabled(true)

            ARCButton(title: "SECONDARY", style: .secondary, onTap: {})
            ARCButton(title: "SECONDARY LOADING", style: .secondary, onTap: {})
                .loading(true)
            ARCButton(title: "SECONDARY DISABLED", style: .secondary, onTap: {})
                .disabled(true)
        }
        .padding()
    }
}
