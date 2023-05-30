//
//  ARCImageContainer.swift
//  ArcUI
//
//  Created by Vlad Bibire on 30/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public struct ARCImageCard: View {

    public var title: String;
    public var subtitle: String;

    init(
        title: String,
        subtitle: String
    ) {
        self.title = title
        self.subtitle = subtitle
    }

    public var body: some View {
        VStack {
            VStack(alignment: .leading, spacing: 8) {
                Text(title)
                    .style(.arcH3)
                Text(subtitle)
            }
            .padding(16)
        }
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color.yellow)
    }
}

struct ARCImageCard_Previews: PreviewProvider {
    static var previews: some View {
        VStack {
            ARCImageCard(title: "Build your evacuation plan", subtitle: "2/3 Complete")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.arcHorizontalPadding)
        .background(Color.arcBackground)
    }
}
