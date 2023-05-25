//
//  ContentView.swift
//  ArcUI Example
//
//  Created by Vlad Bibire on 25/05/2023.
//

import SwiftUI
import ArcUI

struct ContentView: View {
    let sectionPadding: CGFloat = 16

    var body: some View {
        ZStack {
            Rectangle()
                .frame(size: .infinity)
                .foregroundColor(Color.arcAppBG)
                .edgesIgnoringSafeArea(.all)
            ScrollView {
                VStack (alignment: .leading) {
                    // TODO: Replace section titles with ArcUI Text Components
                    Text("Buttons:")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ARCButton(title: "PRIMARY", style: .primary, onTap: {})
                    ARCButton(title: "PRIMARY LOADING", style: .primary, onTap: {})
                        .loading(true)
                    ARCButton(title: "PRIMARY DISABLED", style: .primary, onTap: {})
                        .disabled(true)

                    ARCButton(title: "SECONDARY", style: .secondary, onTap: {})
                    ARCButton(title: "SECONDARY LOADING", style: .secondary, onTap: {})
                }
                .padding(.bottom, sectionPadding)

                VStack (alignment: .leading) {
                    // TODO: Replace section titles with ArcUI Text Components
                    Text("List Items:")
                        .font(.title2)
                        .fontWeight(.semibold)
                    ARCListItem(title: "Map Overlay", subTitle: nil, onTap: {})
                    ARCListItem(title: "Map Overlay", subTitle: "Showing: Hurricane", onTap: {})
                }
                .padding(.bottom, sectionPadding)
            }
            .padding(.arcHorizontalPadding)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
