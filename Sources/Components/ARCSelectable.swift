//
//  SwiftUIView.swift
//  ArcUI
//
//  Created by Vlad Bibire on 29/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public enum SelectableSize: String {
    case small = "Small"
    case fullWidth = "FullWidth"
}

public struct ARCSelectable<Trailing: View>: View {

    public var title: String
    public var isSelected: Bool
    public var size: SelectableSize
    public var onTap: () -> Void

    @ViewBuilder public var trailing: () -> Trailing

    init (
        title: String,
        isSelected: Bool,
        size: SelectableSize = .small,
        onTap: @escaping () -> Void,
        @ViewBuilder trailing: @escaping () -> Trailing
    ) {
        self.title = title
        self.isSelected = isSelected
        self.size = size
        self.onTap = onTap
        self.trailing = trailing
    }



    public var body: some View {
        Button(action: onTap) {
            HStack {
                Text(title)
                    .style(.arcSelectable)
                    .foregroundColor(Color.arcBlack)
                    .padding(.trailing, .ArcSelectable.titlePadding)
                    .frame(maxWidth: size == .fullWidth ? .infinity : nil, alignment: .leading)
                trailing()
            }
            .padding(size == .fullWidth ? .ArcSelectable.largePadding : .ArcSelectable.padding)
            .frame(maxWidth: size == .fullWidth ? .infinity : nil, alignment: .leading)
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
struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        let selected = false
        VStack {
            ARCSelectable(
                title: "Radio Filled",
                isSelected: !selected, onTap: {},
                trailing: {
                    !selected ? Image.arcFilledRadio : Image.arcEmptySelectable
                }
            )
            ARCSelectable(
                title: "Selectable Empty",
                isSelected: selected,
                onTap: {},
                trailing: {
                    selected ? Image.arcFilledCheckbox : Image.arcEmptySelectable
                }
            )
            ARCSelectable(
                title: "Checkbox Filled",
                isSelected: !selected,
                onTap: {},
                trailing: {
                    !selected ? Image.arcFilledCheckbox : Image.arcEmptySelectable
                }
            )
            .padding(.bottom, .arcVerticalPadding)
            ARCSelectable(
                title: "Selectable Empty",
                isSelected: selected,
                size: SelectableSize.fullWidth,
                onTap: {},
                trailing: {
                    selected ? Image.arcFilledCheckbox : Image.arcEmptySelectable
                }
            )
            ARCSelectable(
                title: "Selectable Empty",
                isSelected: !selected,
                size: SelectableSize.fullWidth,
                onTap: {},
                trailing: {
                    !selected ? Image.arcFilledRadio : Image.arcEmptySelectable
                }
            )
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.arcLightGray)
    }
}
