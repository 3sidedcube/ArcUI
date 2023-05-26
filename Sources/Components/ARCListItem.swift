//
//  ARCListItem.swift
//  ArcUI
//
//  Created by Vlad Bibire on 25/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI
import UIKit

/// List Item Component
public struct ARCListItem: View {

    public var title: String
    public var subTitle: String?
    public var onTap: () -> Void

    public init(title: String, subTitle: String?, onTap: @escaping () -> Void) {
        self.title = title
        self.onTap = onTap
        self.subTitle = subTitle
    }

    public var body: some View {
        Button(action: onTap) {
            HStack() {
                VStack(alignment: .leading) {
                    Text(title)
                        .style(.arcListItemTitle)
                        .foregroundColor(.black)
                    if let subTitle = subTitle {
                        Text(subTitle)
                            .style(.arcListItemSubtitle)
                            .foregroundColor(.arcDarkGray)
                    }
                }
                Spacer()
                Image(uiImage: UIImage(named: "Arc-Rounded-Right-Chevron", in: .module, with: nil)!)

            }
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .frame(height: .arcListItemHeight)
        .padding(EdgeInsets.arcListItemContainer)
        .background(Color.arcWhite)
        .overlay(
            Rectangle()
                .frame(width: nil, height: .arcListItemBorder, alignment: .bottom)
                .foregroundColor(Color.arcLightGray), alignment: .bottom
        )
    }
}

struct SwiftUIView_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            Spacer()
            VStack() {
                ARCListItem(title: "Map Overlay", subTitle: nil, onTap: {})
                ARCListItem(title: "Map Overlay", subTitle: "Showing: Hurricane", onTap: {})
            }
            .padding(.horizontal, .arcHorizontalPadding)
            Spacer()
        }
        .background(Color.arcAppBG)
    }
}
