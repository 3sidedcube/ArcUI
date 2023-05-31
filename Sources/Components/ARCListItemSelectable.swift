//
//  ARCListItemSelectable.swift
//  ArcUI
//
//  Created by Vlad Bibire on 31/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public struct ARCListItemSelectable: View {

    public var title: String
    public var isSelected: Bool
    public var onTap: () -> Void

    init (
        title: String,
        isSelected: Bool,
        onTap: @escaping () -> Void
    ) {
        self.title = title
        self.isSelected = isSelected
        self.onTap = onTap
    }

    var image: Image {
        isSelected ? Image.arcFilledRoundedCheckbox : Image.arcEmptyRoundedCheckbox
    }

    public var body: some View {
        Button(action: onTap) {
            HStack {
                Text(title.capitalized)
                    .style(.arcH4)
                    .foregroundColor(.arcBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .multilineTextAlignment(.leading)
                    .padding(EdgeInsets.arcListItemSelectable)
                image
                    .padding(.horizontal, .ArcListItemSelectable.checkboxHorizontalPadding)
            }
            .frame(minHeight: 75)
            .background(Color.arcWhite)
            .overlay(
                Rectangle()
                    .frame(height: .arcBorder)
                    .foregroundColor(Color.arcLightGray)
                , alignment: .bottom
            )
        }
    }
}

struct ARCListItemSelectable_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 0) {
            ARCListItemSelectable(title: "Gather emergency supplies", isSelected: true, onTap: {})
            ARCListItemSelectable(title: "Know your community's evacuation plan", isSelected: false, onTap: {})
            ARCListItemSelectable(title: "Practice your household disaster plan", isSelected: false, onTap: {})
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.arcBackground)
    }
}
