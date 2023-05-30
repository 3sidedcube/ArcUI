//
//  SwiftUIView.swift
//  ArcUI
//
//  Created by Vlad Bibire on 26/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public struct ARCLabel: View {

    public var title: String
    public var color: Color
    public var textColor: Color

    public init(title: String, color: Color = Color.arcRed, textColor: Color = Color.arcWhite) {
        self.title = title
        self.color = color
        self.textColor = textColor
    }

    public var body: some View {
        Text(title)
            .style(.arcLabel)
            .foregroundColor(textColor)
            .padding(.arcLabel)
            .background(color)
            .cornerRadius(.arcCornerRadius)
    }
}

struct ARCLabel_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ARCLabel(title: "New")
            ARCLabel(title: "New", color: Color.arcBlue)
            ARCLabel(title: "New", color: Color.arcBackground, textColor: Color.arcBlack)
        }
    }
}
