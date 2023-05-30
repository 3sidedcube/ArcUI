//
//  SwiftUIView.swift
//  ArcUI
//
//  Created by Vlad Bibire on 29/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public enum SelectableType: String {
    case radio = "Radio"
    case checkbox = "Checkbox"
}

public struct ARCSelectable<Trailing: View>: View {

    public var title: String
    public var isSelected: Bool
    public var onTap: () -> Void

    @ViewBuilder public var trailing: () -> Trailing

    init (
        title: String,
        isSelected: Bool,
        onTap: @escaping () -> Void,
        @ViewBuilder trailing: @escaping () -> Trailing
    ) {
        self.title = title
        self.isSelected = isSelected
        self.onTap = onTap
        self.trailing = trailing
    }



    public var body: some View {
        Button(action: onTap) {
            ZStack {
                Text(title)
                    .style(.arcSelectable)
                    .foregroundColor(Color.arcBlack)
                    .padding(.trailing, .arcSelectableTitlePadding)
                Spacer()
                trailing()
            }
            .padding(.arcSelectablePadding)
            .frame(alignment: .leading)
            .cornerRadius(.arcSelectableCorner)
            .overlay(
                RoundedRectangle(cornerRadius: .arcSelectableCorner)
                    .strokeBorder(
                        isSelected ? Color.arcRed : Color.arcLightGray3, lineWidth: .arcSelectableBorder)
            )
        }
    }
}

struct SwiftUIView_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ARCSelectable(
                title: "Radio Select",
                isSelected: false,
                onTap: {},
                trailing: {

                }
            )
                .padding(.horizontal, .arcHorizontalPadding)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.arcLightGray2)
    }
}
