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

    public var title: String
    public var subtitle: String?
    public var badgeTitle: String?
    public var onTap: () -> Void

    @ViewBuilder public var leading: () -> Leading
    @ViewBuilder public var trailing: () -> Trailing

    public init(
        title: String,
        subtitle: String? = nil,
        badgeTitle: String? = nil,
        @ViewBuilder leading: @escaping () -> Leading,
        @ViewBuilder trailing: @escaping () -> Trailing,
        onTap: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.badgeTitle = badgeTitle
        self.leading = leading
        self.trailing = trailing
        self.onTap = onTap
    }

    public var body: some View {
        Button(action: onTap) {
            HStack {
                HStack(alignment: .center, spacing: 0) {
                    leading()
                    VStack(alignment: .leading, spacing: .ArcListItem.spacing) {
                        Text(title)
                            .style(.arcListItemTitle)
                            .foregroundColor(.arcBlack)
                        if let subtitle = subtitle {
                            Text(subtitle)
                                .style(.arcListItemSubtitle)
                                .foregroundColor(.arcDarkGray)
                        }
                    }
                    if let badgeTitle = badgeTitle {
                        ARCBadge(title: badgeTitle)
                            .padding(.leading, .ArcListItem.badgeLeadingPadding)
                    }
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .multilineTextAlignment(.leading)
                trailing()
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(subtitle == nil ? EdgeInsets.arcListItemContainer : EdgeInsets.arcListItemContainerSubtitle)
        .background(Color.arcWhite)
        .overlay(
            Rectangle()
                .frame(height: .ArcListItem.border)
                .foregroundColor(Color.arcLightGray)
            , alignment: .bottom
        )
    }
}

struct ARCListItem_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            Spacer()
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
                    badgeTitle: "New",
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
            Spacer()
        }
        .background(Color.arcBackground)
    }
}
