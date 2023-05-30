//
//  ARCSelectable.swift
//  ArcUI
//
//  Created by Vlad Bibire on 29/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public enum ARCSelectableType {
    case radio
    case checkbox
}

public struct ARCSelectable: View {

    public var title: String
    public var type: ARCSelectableType
    public var isSelected: Bool
    public var isFullWidth: Bool
    public var onTap: () -> Void

    init (
        title: String,
        type: ARCSelectableType = .radio,
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

    public var body: some View {
        Button(action: onTap) {
            HStack(spacing: .ArcSelectable.spacing) {
                Text(title)
                    .style(.arcListItemTitle)
                    .foregroundColor(Color.arcBlack)
                    .frame(maxWidth: isFullWidth ? .infinity : nil, alignment: .leading)
                if isSelected {
                    type == .radio ? Image.arcFilledRadio : Image.arcFilledCheckbox
                } else {
                    Image.arcEmptySelectable
                }
            }
            .padding(isFullWidth ? .ArcSelectable.largePadding : .ArcSelectable.padding)
            .frame(maxWidth: isFullWidth ? .infinity : nil, alignment: .leading)
            .background(isSelected ? Color.arcLightRed : .clear)
            .cornerRadius(.ArcSelectable.cornerRadius)
            .overlay(
                RoundedRectangle(cornerRadius: .ArcSelectable.cornerRadius)
                    .strokeBorder(
                        isSelected ? Color.arcRed : Color.arcBorderGray, lineWidth: .ArcSelectable.border)
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
        .background(Color.arcLightGray)
    }
}
