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
    public var onTap: () -> Void

    public init(title: String, subtitle: String?, onTap: @escaping () -> Void) {
        self.title = title
        self.onTap = onTap
        self.subtitle = subtitle
    }

    public var body: some View {
        Button(action: onTap) {
            HStack {
                VStack(alignment: .leading, spacing: 0) {
                    Text(title)
                        .style(.arcListItemTitle)
                        .foregroundColor(.arcBlack)
                    if let subtitle = subtitle {
                        Text(subtitle)
                            .style(.arcListItemSubtitle)
                            .foregroundColor(.arcDarkGray)
                            .padding(.top, 4)
                    }
                }
                Spacer()
                Image.arcRoundedRightChevron()

            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: .arcListItemHeight)
        .padding(EdgeInsets.arcListItemContainer)
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
                ARCListItem(title: "Map Overlay", subtitle: nil, onTap: {})
                ARCListItem(title: "Map Overlay", subtitle: "Showing: Hurricane", onTap: {})
            }
            .padding(.horizontal, .arcHorizontalPadding)
            Spacer()
        }
        .background(Color.arcAppBG)
    }
}
