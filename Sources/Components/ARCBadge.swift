//
//  SwiftUIView.swift
//  ArcUI
//
//  Created by Vlad Bibire on 26/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public struct ARCBadge: View {

    public var title: String
    public var color: Color
    public var textColor: Color?

    public init(title: String, color: Color = Color.arcRed, textColor: Color? = Color.arcWhite) {
        self.title = title
        self.color = color
        self.textColor = textColor
    }

    public var body: some View {
        Text(title)
            .style(.arcBadge)
            .foregroundColor(textColor)
            .padding(.arcBadge)
            .background(color)
            .cornerRadius(.ArcBadge.cornerRadius)
    }
}

struct SARCBadge_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ARCBadge(title: "New")
            ARCBadge(title: "New", color: Color.arcBlue)
            ARCBadge(title: "New", color: Color.arcBackground, textColor: Color.arcBlack)
        }
    }
}
