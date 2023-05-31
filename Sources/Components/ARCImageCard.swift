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

    init(
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
                    .frame(width: .infinity, height: .ArcImageCard.imageHeight)
                    .clipped()
                // Body
                VStack(alignment: .leading, spacing: 8) {
                    Text(title)
                        .style(.arcH3)
                    Text(subtitle)
                        .style(.arcH4)
                        .foregroundColor(.arcDarkGray)
                }
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
                        .frame(maxWidth: .infinity)
                    Image.arcRoundedRightChevron
                }
                .multilineTextAlignment(.leading)
                .padding(EdgeInsets.arcImageCardFooter)
            }
            .background(Color.arcWhite)
            .cornerRadius(.arcCornerRadius)
            .shadow(.arcContainer)
        }
        .buttonStyle(PlainButtonStyle())
    }
}

struct ARCImageCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ARCImageCard(title: "Build your evacuation plan", subtitle: "2/3 Complete", footerTitle: "View Goal", image: Image.arcImageCardPreview, onTap: {})
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.arcHorizontalPadding)
        .background(Color.arcBackground)
    }
}
