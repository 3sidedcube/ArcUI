//
//  ARCListItem.swift
//  ArcUI
//
//  Created by Vlad Bibire on 25/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

/// List Item Component
public struct ARCListItem<Leading: View, Trailing: View>: View {

    /// Functional
    public var title: String
    public var subtitle: String?
    public var labelTitle: String?
    public var onTap: () -> Void
    /// Styling
    public var background: Color?
    public var titleForeground: Color?
    public var subtitleForeground: Color?
    public var borderless: Bool?
    public var borderColor: Color?
    public var verticalPadding: CGFloat?

    @ViewBuilder public var leading: () -> Leading
    @ViewBuilder public var trailing: () -> Trailing

    public init(
        title: String,
        subtitle: String? = nil,
        labelTitle: String? = nil,
        @ViewBuilder leading: @escaping () -> Leading,
        @ViewBuilder trailing: @escaping () -> Trailing,
        onTap: @escaping () -> Void,
        background: Color? = Color.arcWhite,
        titleForeground: Color? = Color.arcBlack,
        subtitleForeground: Color? = Color.arcDarkGray,
        borderless: Bool = false,
        borderColor: Color? = Color.arcLightGray,
        verticalPadding: CGFloat? = .ArcListItem.verticalPadding
    ) {
        self.title = title
        self.subtitle = subtitle
        self.labelTitle = labelTitle
        self.leading = leading
        self.trailing = trailing
        self.onTap = onTap
        self.background = background
        self.titleForeground = titleForeground
        self.subtitleForeground = subtitleForeground
        self.borderless = borderless
        self.borderColor = borderColor
        self.verticalPadding = verticalPadding
    }

    public var body: some View {
        Button(action: onTap) {
            HStack(spacing: 0) {
                leading()
                VStack(alignment: .leading, spacing: .ArcListItem.spacing) {
                    Text(title)
                        .style(.arcH4)
                        .foregroundColor(titleForeground)
                    if let subtitle {
                        Text(subtitle)
                            .style(.arcBody2)
                            .foregroundColor(subtitleForeground)
                    }
                }
                if let labelTitle {
                    ARCLabel(title: labelTitle)
                        .padding(.leading, .ArcListItem.labelLeadingPadding)
                }
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .multilineTextAlignment(.leading)
            .padding(.vertical, verticalPadding)
            .padding(subtitle == nil ? EdgeInsets.arcListItemContainer : EdgeInsets.arcListItemContainerSubtitle)
            trailing()
            .padding(.trailing, .ArcListItem.trailingPadding)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(background)
        .overlay(
            alignment: .bottom,
            content: {
                if borderless == nil || borderless == false {
                    Rectangle()
                        .frame(height: .arcBorder)
                        .foregroundColor(borderColor)
                }
            }
        )
    }
}

struct ARCListItem_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            VStack {
                ARCListItem(
                    title: "Map Overlay",
                    leading: { EmptyView() },
                    trailing: {
                        Image.arcRoundedRightChevron
                            .padding(.leading, .ArcListItem.chevronPadding)
                    },
                    onTap: {}
                )
                ARCListItem(
                    title: "Map Overlay",
                    leading: { EmptyView() },
                    trailing: {
                        Image.arcRoundedRightChevron
                            .padding(.leading, .ArcListItem.chevronPadding)
                    },
                    onTap: {},
                    background: Color.arcCharcoal,
                    titleForeground: Color.arcWhite
                )
                ARCListItem(
                    title: "Map Overlay",
                    leading: { EmptyView() },
                    trailing: {
                        Image.arcRoundedRightChevron
                            .padding(.leading, .ArcListItem.chevronPadding)
                    },
                    onTap: {},
                    background: Color.arcBlack,
                    titleForeground: Color.arcWhite,
                    verticalPadding: 20
                )
                .cornerRadius(.arcCornerRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: .arcCornerRadius)
                        .strokeBorder(Color.arcDarkGray, lineWidth: .arcBorder)
                )
                ARCListItem(
                    title: "Map Overlay",
                    subtitle: "Showing: Hurricane",
                    leading: { EmptyView() },
                    trailing: {
                        Image.arcRoundedRightChevron
                            .padding(.leading, .ArcListItem.chevronPadding)
                    },
                    onTap: {}
                )
                ARCListItem(
                    title: "This is a very long title indeed that won't end very soon even if it breaks the UI",
                    subtitle: "This is a very long description indeed that won't end very soon even if it breaks the UI",
                    leading: { EmptyView() },
                    trailing: {
                        Image.arcRoundedRightChevron
                            .padding(.leading, .ArcListItem.chevronPadding)
                    },
                    onTap: {}
                )

                ARCListItem(
                    title: "Map Overlay",
                    labelTitle: "New",
                    leading: { EmptyView() },
                    trailing: {
                        Image.arcRoundedRightChevron
                            .padding(.leading, .ArcListItem.chevronPadding)
                    },
                    onTap: {}
                )

                ARCListItem(
                    title: "Map Overlay",
                    leading: {
                        Image.arcListItemLeading
                            .padding(.trailing, 12)
                    },
                    trailing: {
                        Image.arcRoundedRightChevron
                            .padding(.leading, .ArcListItem.chevronPadding)
                    },
                    onTap: {}
                )
            }
            .padding(.horizontal, .arcHorizontalPadding)
            .frame(maxHeight: .infinity)
        }
        .background(Color.arcBackground)
    }
}
