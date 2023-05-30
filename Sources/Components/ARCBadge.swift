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
    public var color: Color?
    public var textcolor: Color?

    public init(title: String, color: Color? = Color.arcRed, textcolor: Color? = Color.arcWhite) {
        self.title = title
        self.color = color
        self.textcolor = textcolor
    }

    public var body: some View {
        VStack {
            Text(title)
                .style(.arcBadge)
                .foregroundColor(textcolor)
                .padding(.arcBadge)
        }
        .background(color)
        .cornerRadius(.ArcBadge.cornerRadius)
    }
}

struct SARCBadge_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ARCBadge(title: "New")
            ARCBadge(title: "New", color: Color.arcBlue)
            ARCBadge(title: "New", color: Color.arcBackground, textcolor: Color.arcBlack)
        }
    }
}
