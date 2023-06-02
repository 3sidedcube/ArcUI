//
//  ARCSelectable.swift
//  ArcUI
//
//  Created by Vlad Bibire on 29/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public struct ARCSelectable: View {

    public enum Control {
        case radio
        case checkbox
    }

    public var title: String
    public var type: Control
    public var isSelected: Bool
    public var isFullWidth: Bool
    public var onTap: () -> Void

    public init(
        title: String,
        type: Control = .radio,
        isSelected: Bool,
        isFullWidth: Bool = false,
        onTap: @escaping () -> Void
    ) {
        self.title = title
        self.type = type
        self.isSelected = isSelected
        self.isFullWidth = isFullWidth
        self.onTap = onTap
    }

    var image: Image {
        guard isSelected else { return Image.arcEmptySelectable }
        return type == .radio ? Image.arcFilledRadio : Image.arcFilledCheckbox
    }

    public var body: some View {
        Button(action: onTap) {
            HStack(spacing: .ArcSelectable.spacing) {
                Text(title)
                    .style(.arcH4)
                    .foregroundColor(Color.arcBlack)
                    .frame(maxWidth: isFullWidth ? .infinity : nil, alignment: .leading)
                image
            }
            .padding(isFullWidth ? .ArcSelectable.largePadding : .ArcSelectable.padding)
            .frame(maxWidth: isFullWidth ? .infinity : nil, alignment: .leading)
            .background(isSelected ? Color.arcLightRed : .clear)
            .cornerRadius(.arcCornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: .arcCornerRadius)
                    .strokeBorder(
                        isSelected ? Color.arcRed : Color.arcBorderGray, lineWidth: .arcBorder)
            )
        }
    }
}

// Mark : - Preview
struct ARCSelectable_Previews: PreviewProvider {
    static var previews: some View {
        let selected = false
        VStack {
            ARCSelectable(
                title: "Radio Filled",
                isSelected: !selected,
                onTap: {}
            )
            ARCSelectable(
                title: "Selectable Empty",
                isSelected: selected,
                onTap: {}
            )
            ARCSelectable(
                title: "Checkbox Filled",
                type: .checkbox,
                isSelected: !selected,
                onTap: {}
            )
            .padding(.bottom, .arcVerticalPadding)
            ARCSelectable(
                title: "Selectable Empty",
                isSelected: selected,
                isFullWidth: true,
                onTap: {}
            )
            ARCSelectable(
                title: "Selectable Empty",
                isSelected: !selected,
                isFullWidth: true,
                onTap: {}
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.horizontal, .arcHorizontalPadding)
        .background(Color.arcLightGray)
    }
}
