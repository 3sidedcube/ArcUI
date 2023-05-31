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
    public var emptyColor: Color
    public var filledColor: Color

    public init(
        total: Int,
        progress: Float,
        emptyColor: Color = Color.arcPeach,
        filledColor: Color = Color.arcRed
    ) {
        self.total = total
        self.progress = progress
        self.emptyColor = emptyColor
        self.filledColor = filledColor
    }

    public var body: some View {
        HStack(spacing: .ArcProgressBar.spacing) {
            ForEach(0..<total, id: \.self) { current in
                CapsuleView(current: current, progress: progress, emptyColor: emptyColor, filledColor: filledColor)
            }
        }
        .frame(maxWidth: .infinity)
    }
}


// MARK: Capsule View

struct CapsuleView: View {
    let current: Int
    let progress: Float
    let emptyColor: Color
    let filledColor: Color

    /// Current capsule is a non-empty one
    var isFilledCapsule: Bool {
        Float(current) < progress
    }

    /// Last capsule left over
    var leftOver: Float {
        progress - Float(current)
    }

    /// Check if current is a filled or partially filled capsule
    var isPartiallyFilled: Bool {
        leftOver < 1
    }

    /// Calucate by how much last pilled needs to be divided by
    var partiallyDividedBy: Float {
        1 / (1 - (1 - leftOver))
    }

    var body: some View {
        ZStack(alignment: .leading) {
            Capsule().fill(emptyColor)
            if isFilledCapsule {
                Capsule().fill(filledColor)
                    .frame(
                        width: isPartiallyFilled ? .ArcProgressBar.caspuleWidth / CGFloat(partiallyDividedBy) : .ArcProgressBar.caspuleWidth,
                        height: .ArcProgressBar.capsuleHeight
                    )
            }
        }
        .frame(width: .ArcProgressBar.caspuleWidth, height: .ArcProgressBar.capsuleHeight)
    }
}

// MARK: Preview

struct ARCProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 40) {
            ARCProgressBar(total: 5, progress: 2)
            ARCProgressBar(total: 5, progress: 3.5)
            ARCProgressBar(total: 5, progress: 2.75)
            ARCProgressBar(total: 5, progress: 1.25, emptyColor: Color.arcDarkGray, filledColor: Color.arcBlack)
        }
    }
}
