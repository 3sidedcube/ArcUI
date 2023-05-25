//
//  ARCListItem.swift
//  ArcUI
//
//  Created by Vlad Bibire on 25/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

public struct ARCListItem: View {
    public var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            VStack {
                HStack() {
                    Text("Hello")
                        .font(.body)
                        .foregroundColor(.white)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(EdgeInsets.arcListItemContainer)
                .background(Color.arcWhite)
            }
            .padding(.horizontal)
        }
        .accentColor(.black)
    }
}

struct SwiftUIView_Previews: PreviewProvider {

    static var previews: some View {
        VStack {
            ARCListItem()
        }
    }
}
