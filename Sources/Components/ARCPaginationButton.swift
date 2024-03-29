//
//  ARCPaginationButton.swift
//  ArcUI
//
//  Created by Vlad Bibire on 30/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public struct ARCPaginationButton: View {

    public var title: String
    public var onTap: () -> Void

    @Environment(\.isEnabled) public var isEnabled: Bool

    public init(
        title: String,
        onTap: @escaping () -> Void
    ) {
        self.title = title
        self.onTap = onTap
    }

    public var body: some View {
        Button(action: onTap) {
            HStack {
                Text(title)
                    .style(.arcButton)
                    .frame(maxWidth: .infinity, alignment: .leading)
                isEnabled ? Image.arcRoundedRightChevron : Image.arcRoundedRightChevronDisabled
            }
            .padding(EdgeInsets.arcPaginationButton)
            .frame(maxWidth: .infinity)
            .background(Color.arcWhite)
            .cornerRadius(.arcCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: .arcCornerRadius)
                    .strokeBorder(Color.arcLightGray, lineWidth: .ArcPaginationButton.border)
            )
            .shadow(.arcLightContainer)
        }
        .buttonStyle(ARCPaginationButtonStyle())
    }
}

// MARK: - ARCPaginationButtonStyle
struct ARCPaginationButtonStyle: ButtonStyle {
    @Environment(\.isEnabled) var isEnabled
    func makeBody(configuration: Self.Configuration) -> some View {
        configuration.label
            .foregroundColor(isEnabled ? .arcBlack : .arcDarkGray)
            .opacity(configuration.isPressed ? 0.5 : 1.0)
    }
}

struct ARCPaginationButton_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            HStack(spacing: 12) {
                ARCPaginationButton(title: "toolkit".uppercased(), onTap: {}).disabled(true)
                ARCPaginationButton(title: "your to-dos".uppercased(), onTap: {})
            }
        }
        .padding(.horizontal, .arcHorizontalPadding)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.arcBackground)
    }
}
