//
//  ListItem.swift
//  ForPlanet
//
//  Created by Ben Shutt on 26/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

/// A generic list item UI
struct ListItemX<Leading: View, Trailing: View>: View {

    /// Title text
    var title: String

    /// Subtitle text
    var subtitle: String?

    /// The leading content view
    @ViewBuilder var leading: () -> Leading

    /// The trailing content view
    @ViewBuilder var trailing: () -> Trailing

    var body: some View {
        HStack(spacing: 8) {
            leading()

            VStack(spacing: 4) {
                Text(verbatim: title)
                    .font(.system(size: 16, weight: .bold))
                    .foregroundColor(.black)
                    .frame(maxWidth: .infinity, alignment: .leading)

                if let subtitle {
                    Text(verbatim: subtitle)
                        .font(.system(size: 14, weight: .regular))
                        .foregroundColor(Color(white: 50 / 255))
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
            }
            .multilineTextAlignment(.leading)

            trailing()
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 20)
        .background(Color.white)
    }
}

// MARK: - PreviewProvider

//struct ListItemX_Previews: PreviewProvider {
//
//    static var previews: some View {
//        ScrollView {
//            VStack {
//                ListItemX(
//                    title: "List Item",
//                    subtitle: "Some subtitle text",
//                    leading: {
//                        Image(systemName: "star.fill")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .foregroundColor(.yellow)
//                            .frame(size: 30)
//                    },
//                    trailing: {
//                        Image(systemName: "chevron.right.square.fill")
//                            .resizable()
//                            .aspectRatio(contentMode: .fit)
//                            .foregroundColor(.red)
//                            .frame(size: 22)
//                    })
//
//                Spacer()
//            }
//        }
//        .frame(maxWidth: .infinity, maxHeight: .infinity)
//        .background(Color(white: 220 / 255))
//    }
//}
