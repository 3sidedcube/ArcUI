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
    public var progress: Float

    public init(
        total: Int,
        progress: Float
    ) {
        self.total = total
        self.progress = progress
    }

    public var body: some View {
        HStack(spacing: .ArcProgressBar.spacing) {
            ForEach(0..<total, id: \.self) { current in
                let isFilledCapsule = Float(current) < progress
                let leftOver = progress - Float(current)
                let isPartiallyFilled = leftOver < 1
                let partiallyDevidedBy = 1 / (1 - (1 - leftOver))

                ZStack(alignment: .leading) {
                    Capsule().fill(Color.arcPeach)
                    if isFilledCapsule {
                        Capsule().fill(Color.arcRed)
                            .frame(
                                width: isPartiallyFilled ? .ArcProgressBar.caspuleWidth / CGFloat(partiallyDevidedBy) : .ArcProgressBar.caspuleWidth,
                                height: .ArcProgressBar.capsuleHeight
                            )
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
        VStack(spacing: 40) {
            ARCProgressBar(total: 5, progress: 3)
            ARCProgressBar(total: 5, progress: 3.5)
            ARCProgressBar(total: 5, progress: 3.75)
        }
    }
}
