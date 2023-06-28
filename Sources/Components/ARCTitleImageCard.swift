//
//  ARCTitleImageCard.swift
//  ArcUI
//
//  Created by Vlad Bibire on 13/06/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public struct ARCTitleImageCard<Trailing: View>: View {

    public var title: String
    public var subtitle: String
    public var image: Image

    @ViewBuilder public var trailing: () -> Trailing

    @Environment(\.verticalSizeClass) var verticalSizeClass

    public init(
        title: String,
        subtitle: String,
        image: Image,
        @ViewBuilder trailing: @escaping () -> Trailing
    ) {
        self.title = title
        self.subtitle = subtitle
        self.image = image
        self.trailing = trailing
    }

    public var body: some View {
        VStack(spacing: 0) {
            TitleImageCardHeader(
                title: title,
                subtitle: subtitle
            )
            if verticalSizeClass == .regular {
                image
                    .resizable()
                    .scaledToFill()
                    .frame(maxWidth: .infinity, maxHeight: .ArcTitleImageCard.imageHeight)
                    .cornerRadius(.arcCornerRadius)
                    .padding(.top, .arcVerticalPadding)
            }
            trailing()
                .padding(.top, .arcVerticalPadding)
                .frame(maxWidth: .infinity)
                .arcSeparator()
        }
        .padding(.horizontal, verticalSizeClass == .regular ? .arcVerticalPadding : 0)
        .padding(.vertical, .arcVerticalPadding)
        .multilineTextAlignment(.center)
        .background(Color.arcWhite)
        .cornerRadius(.arcCornerRadius)
    }
}

// MARK: - TitleImageCardHeader

private struct TitleImageCardHeader: View {

    var title: String
    var subtitle: String

    @Environment(\.verticalSizeClass) var verticalSizeClass

    var body: some View {
        if verticalSizeClass == .regular {
            VStack(spacing: 0) {
                Text(verbatim: title)
                    .style(.arcH2)
                    .foregroundColor(.arcBlack)
                Text(verbatim: subtitle)
                    .style(.arcH4)
                    .foregroundColor(.arcDarkGray)
                    .padding(.top, .ArcTitleImageCard.subtitlePaddingTop)
            }
        } else {
            HStack(alignment: .center) {
                Text(verbatim: title)
                    .style(.arcH2)
                    .foregroundColor(.arcBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                Text(verbatim: subtitle)
                    .style(.arcH4)
                    .foregroundColor(.arcDarkGray)
                    .frame(maxWidth: .infinity, alignment: .trailing)
            }
            .multilineTextAlignment(.leading)
            .padding(.vertical, .arcVerticalPadding)
            .padding(.horizontal, .arcHorizontalPadding)
        }
    }
}

struct ARCTitleImageCardView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ARCTitleImageCard(
                title: "Add Your Home Location",
                subtitle: "Get alerted and prepared for hazards where you live.",
                image: Image.arcImageCardPreview,
                trailing: {
                    ARCButton(
                        title: "Add Home Location",
                        style: .primary,
                        icon: .arcPlusIcon,
                        onTap: {}
                    )
                }
            )
            .padding(.horizontal, .arcHorizontalPadding)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.arcBackground)
        .previewInterfaceOrientation(.landscapeLeft)
    }
}
