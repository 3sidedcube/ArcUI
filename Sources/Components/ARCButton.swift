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
    public enum Style: Equatable {

        /// Filled red
        case primary

        /// Stroked blue
        case secondary

        /// Underline blue
        case underline

        /// Disabled state
        case disabled

        /// Custom state
        case custom(backgroundColor: Color, borderColor: Color, textColor: Color)
    }
    
    ///
    /// A small helper type that describes how an ARCButton should size itself in different
    /// interface orientations (portrait vs. landscape).
    ///
    /// ButtonLayout separates the sizing rules into two `Layout` configurations—one for
    /// portrait and one for landscape—so that a button can expand to fill the available
    /// width in portrait while using a fixed width in landscape, or any other combination
    /// you define.
    ///
    /// Although ARCButton currently applies sizing directly via `verticalSizeClass`,
    /// ButtonLayout documents and encapsulates the intended sizing behavior and can be
    /// used to centralize those decisions.
    ///
    /// Example
    /// ```swift
    /// // Portrait: fill available width
    /// // Landscape: fixed width of 336pt
    /// let layout = ButtonLayout.default
    ///
    /// // Custom example:
    /// let custom = ButtonLayout(
    ///     portrait: .init(width: nil, maxWidth: .infinity), // full-width in portrait
    ///     landscape: .init(width: 280, maxWidth: nil)       // fixed 280pt in landscape
    /// )
    /// ```
    public struct ButtonLayout {
        /// A concrete sizing rule for a button.
        ///
        /// - width:
        ///   A fixed width to apply to the button. Use `nil` to avoid constraining the width
        ///   explicitly. When non-nil, the button will be sized to this exact width.
        ///
        /// - maxWidth:
        ///   A maximum width to apply to the button. Use `.infinity` to make the button
        ///   stretch to fill the available horizontal space (equivalent to `frame(maxWidth: .infinity)`).
        ///   Use `nil` to leave the maximum width unconstrained.
        ///
        /// Notes
        /// - You can set both `width` and `maxWidth` to `nil` to let the button size to its
        ///   intrinsic content.
        /// - Prefer setting only one of `width` or `maxWidth` to avoid conflicting constraints.
        public struct Layout {
            /// A fixed width for the button. `nil` means no explicit width constraint.
            public let width: CGFloat?

            /// A maximum width for the button. Use `.infinity` to expand to fill available space.
            /// `nil` means no explicit max-width constraint.
            public let maxWidth: CGFloat?

            /// The default portrait layout: stretches to full width.
            ///
            /// Equivalent to applying `frame(maxWidth: .infinity)` in SwiftUI.
            public static let defaultPortrait: Layout = .init(
                width: nil,
                maxWidth: .infinity
            )
            
            /// The default landscape layout: uses a fixed width of 336 points.
            ///
            /// Equivalent to applying `frame(width: 336)` in SwiftUI.
            public static let defaultLandscape: Layout = .init(
                width: .ArcButton.landscapeWidth,
                maxWidth: nil
            )

            /// Public memberwise initializer
            public init(width: CGFloat?, maxWidth: CGFloat?) {
                self.width = width
                self.maxWidth = maxWidth
            }
        }
        
        /// The layout rules used when the interface is in portrait (regular vertical size class).
        public let portrait: Layout

        /// The layout rules used when the interface is in landscape (compact vertical size class).
        public let landscape: Layout

        /// A ready-made configuration that mirrors the current default ARCButton behavior:
        /// - Portrait: full-width (maxWidth = .infinity)
        /// - Landscape: fixed width of 336pt
        public static let `default`: ButtonLayout  = .init(
            portrait: .defaultPortrait,
            landscape: .defaultLandscape
        )

        /// Public memberwise initializer
        public init(portrait: Layout, landscape: Layout) {
            self.portrait = portrait
            self.landscape = landscape
        }
    }

    @Environment(\.verticalSizeClass) var verticalSizeClass
    @Environment(\.isLoading) public var isLoading: Bool
    @Environment(\.isEnabled) public var isEnabled: Bool

    public var title: String
    public var style: Style
    public var onTap: () -> Void
    public var icon: Image?
    public var minimumScaleFactor: CGFloat
    public var lineLimit: Int?
    public var layout: ButtonLayout

    /// Mapped `Style` based on states
    private var buttonStyle: Style {
        isLoading || !isEnabled ? .disabled : style
    }

    public init(
        title: String,
        style: Style,
        icon: Image? = nil,
        minimumScaleFactor: CGFloat = 1,
        lineLimit: Int? = nil,
        layout: ButtonLayout = .default,
        onTap: @escaping () -> Void
    ) {
        self.title = title
        self.style = style
        self.icon = icon
        self.onTap = onTap
        self.minimumScaleFactor = minimumScaleFactor
        self.lineLimit = lineLimit
        self.layout = layout
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
            .frame(width: verticalSizeClass == .regular ? layout.portrait.width : layout.landscape.width)
            .frame(maxWidth: verticalSizeClass == .regular ? layout.portrait.maxWidth : layout.landscape.maxWidth)
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
        case .custom(let backgroundColor, _, _) : return backgroundColor
        }
    }

    var borderColor: Color {
        switch self {
        case .primary: return .clear
        case .secondary: return .arcBlue
        case .underline: return .clear
        case .disabled: return .clear
        case .custom(_, let borderColor, _) : return borderColor
        }
    }

    var textColor: Color {
        switch self {
        case .primary: return .arcWhite
        case .secondary: return .arcBlue
        case .underline: return .arcBlue
        case .disabled: return .arcWhite
        case .custom(_, _, let textColor) : return textColor
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
            ARCButton(title: "CUSTOM", style: .custom(backgroundColor: .arcBlue, borderColor: .clear, textColor: .arcWhite), onTap: {})
        }
        .padding()
//        .previewInterfaceOrientation(.landscapeLeft)
    }
}
