//
//  ARCImageCard.swift
//  ArcUI
//
//  Created by Vlad Bibire on 30/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public struct ARCImageCard: View {

    public var title: String
    public var subtitle: String
    public var footerTitle: String
    public var image: Image
    public var onTap: () -> Void

    public init(
        title: String,
        subtitle: String,
        footerTitle: String,
        image: Image,
        onTap: @escaping () -> Void
    ) {
        self.title = title
        self.subtitle = subtitle
        self.footerTitle = footerTitle
        self.image = image
        self.onTap = onTap
    }

    public var body: some View {
        Button(action: onTap) {
            VStack(alignment: .leading, spacing: 0) {
                // Image
                image
                    .resizable()
                    .scaledToFill()
                    .frame(height: .ArcImageCard.imageHeight)
                    .frame(maxWidth: .infinity)
                    .clipped()
                // Body
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .style(.arcH3)
                        .foregroundColor(.arcBlack)
                    Text(subtitle)
                        .style(.arcH4)
                        .foregroundColor(.arcDarkGray)
                }
                .foregroundColor(.arcWhite)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.ArcImageCard.padding)
                .overlay(
                    Rectangle()
                        .frame(height: .arcBorder)
                        .foregroundColor(Color.arcLightGray),
                    alignment: .bottom
                )
                // Footer
                HStack(spacing: 0) {
                    Text(footerTitle)
                        .style(.arcH4)
                        .foregroundColor(.arcBlack)
                        .frame(maxWidth: .infinity, alignment: .leading)
                    Image.arcRoundedRightChevron
                }
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets.arcImageCardFooter)
            }
            .background(Color.arcWhite)
            .cornerRadius(.arcCornerRadius)
            .shadow(.arcContainer)
        }
    }
}

struct ARCImageCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 24) {
            ARCImageCard(title: "Build your evacuation plan", subtitle: "2/3 Complete", footerTitle: "View Goal", image: Image.arcImageCardPreview, onTap: {})
            ARCImageCard(title: "This is a very long title indeed that won't end very soon and will try to break the UI", subtitle: "This is also a very long long description that will not end very soon and will try to break the UI.", footerTitle: "View Goal", image: Image.arcImageCardPreview, onTap: {})
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.arcHorizontalPadding)
        .background(Color.arcBackground)
    }
}
