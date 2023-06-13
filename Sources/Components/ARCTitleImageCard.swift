//
//  ARCTitleImageCard.swift
//  ArcUI
//
//  Created by Vlad Bibire on 13/06/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct ARCTitleImageCard<Trailing: View>: View {

    public var title: String
    public var subtitle: String
    public var image: Image

    @ViewBuilder public var trailing: () -> Trailing

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
            Text(verbatim: title)
                .style(.arcH2)
                .foregroundColor(.arcBlack)
                .padding(.bottom, 8)
            Text(verbatim: subtitle)
                .style(.arcH4)
                .foregroundColor(.arcDarkGray)
                .padding(.bottom, .arcVerticalPadding)
            image
                .resizable()
                .scaledToFill()
                .frame(width: .infinity, height: 120)
                .cornerRadius(.arcCornerRadius)
                .padding(.bottom, .arcVerticalPadding)
            trailing()
        }
        .padding(12)
        .padding(.top, .arcVerticalPadding)
        .multilineTextAlignment(.center)
        .background(Color.arcWhite)
        .cornerRadius(.arcCornerRadius)
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
                        onTap: {}
                    )
                }
            )
            .padding(.horizontal, .arcHorizontalPadding)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.arcBackground)
    }
}
