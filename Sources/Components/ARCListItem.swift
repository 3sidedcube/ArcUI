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
public struct ARCListItem: View {

    public var title: String
    public var subtitle: String?
    public var badgetitle: String?
    public var onTap: () -> Void

    public init(title: String, subtitle: String? = nil, badgetitle: String? = nil, onTap: @escaping () -> Void) {
        self.title = title
        self.subtitle = subtitle
        self.badgetitle = badgetitle
        self.onTap = onTap
    }

    public var body: some View {
        Button(action: onTap) {
            HStack {
                HStack(alignment: .center, spacing: 0) {
                    VStack(alignment: .leading, spacing: 0) {
                        Text(title)
                            .style(.arcListItemTitle)
                            .foregroundColor(.arcBlack)
                        if let subtitle = subtitle {
                            Text(subtitle)
                                .style(.arcListItemSubtitle)
                                .foregroundColor(.arcDarkGray)
                                .padding(.top, .arcListItemSubtitlePadding)
                        }
                    }
                    .multilineTextAlignment(.leading)
                    if let badgetitle = badgetitle {
                        VStack {
                            Text(badgetitle)
                                .style(.arcListItemBadge)
                                .foregroundColor(.arcWhite)
                                .padding(.vertical, 4)
                                .padding(.horizontal, 8)
                        }
                        .background(Color.arcRed)
                        .cornerRadius(6)
                        .padding(.leading, 8)
                    }
                }
                Spacer()
                Image.arcRoundedRightChevron()
                    .padding(.leading, .arcListItemChevronPadding)

            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .padding(subtitle == nil ? EdgeInsets.arcListItemContainer : EdgeInsets.arcListItemContainerSubtitle)
        .background(Color.arcWhite)
        .overlay(
            Rectangle()
                .frame(height: .arcListItemBorder)
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
                ARCListItem(title: "Map Overlay", onTap: {})
                ARCListItem(title: "Map Overlay", subtitle: "Showing: Hurricane", onTap: {})
                ARCListItem(title: "This is a very long title indeed that won't end very soon even if it breaks the UI", subtitle: "This is a very long description indeed that won't end very soon even if it breaks the UI", onTap: {})
                ARCListItem(title: "Map Overlay", badgetitle: "New", onTap: {})
            }
            .padding(.horizontal, .arcHorizontalPadding)
            Spacer()
        }
        .background(Color.arcAppBG)
    }
}
