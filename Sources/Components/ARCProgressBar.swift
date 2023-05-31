//
//  ARCProgressBar.swift
//  ArcUI
//
//  Created by Vlad Bibire on 31/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public struct ARCProgressBar: View {

    public var total: Int
    public var progress: Int

    public init(
        total: Int,
        progress: Int
    ) {
        self.total = total
        self.progress = progress
    }

    public var body: some View {
        HStack(spacing: .ArcProgressBar.spacing) {
            ForEach(0..<total, id: \.self) { current in
                ZStack(alignment: .leading) {
                    Capsule().fill(Color.arcPeach)
                    if current < progress {
                        Capsule().fill(Color.arcRed)
                            .frame(width: .ArcProgressBar.caspuleWidth, height: .ArcProgressBar.capsuleHeight)
                    }
                }
                .frame(width: .ArcProgressBar.caspuleWidth, height: .ArcProgressBar.capsuleHeight)
            }
        }
        .frame(maxWidth: .infinity)
    }
}

struct ARCProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        ARCProgressBar(total: 5, progress: 2)
    }
}
