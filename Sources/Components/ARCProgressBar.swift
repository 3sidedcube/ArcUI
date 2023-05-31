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
    public var capsuleWidth: CGFloat
    public var capsuleHeight: CGFloat
    public var emptyColor: Color
    public var filledColor: Color

    public init(
        total: Int,
        progress: Float,
        capsuleWidth: CGFloat,
        capsuleHeight: CGFloat,
        emptyColor: Color = Color.arcPeach,
        filledColor: Color = Color.arcRed
    ) {
        self.total = total
        self.progress = progress
        self.capsuleWidth = capsuleWidth
        self.capsuleHeight = capsuleHeight
        self.emptyColor = emptyColor
        self.filledColor = filledColor
    }

    public var body: some View {
        HStack(spacing: .ArcProgressBar.spacing) {
            ForEach(0..<total, id: \.self) { current in
                CapsuleView(
                    current: current,
                    progress: progress,
                    capsuleWidth: capsuleWidth,
                    capsuleHeight: capsuleHeight,
                    emptyColor: emptyColor,
                    filledColor: filledColor
                )
            }
        }
        .frame(maxWidth: .infinity)
    }
}


// MARK: Capsule View

struct CapsuleView: View {
    let current: Int
    let progress: Float
    let capsuleWidth: CGFloat
    let capsuleHeight: CGFloat
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
        guard leftOver > 0 else { return 1 }
        return 1 / (1 - (1 - leftOver))
    }

    var body: some View {
        ZStack(alignment: .leading) {
            Capsule().fill(emptyColor)
            if isFilledCapsule {
                Capsule().fill(filledColor)
                    .frame(
                        width: isPartiallyFilled ? capsuleWidth / CGFloat(partiallyDividedBy) : capsuleWidth,
                        height: capsuleHeight
                    )
            }
        }
        .frame(width: capsuleWidth, height: capsuleHeight)
    }
}

// MARK: Preview

struct ARCProgressBar_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReader { reader in
            let total: Int = 4
            let capsuleWidth = (reader.size.width / CGFloat(total)) - .arcHorizontalPadding
            let capsuleHeight = CGFloat.ArcProgressBar.capsuleHeight

            VStack(spacing: 20) {
                ARCProgressBar(total: total, progress: 2.5, capsuleWidth: capsuleWidth, capsuleHeight: capsuleHeight)
                ARCProgressBar(total: total, progress: 3.5, capsuleWidth: capsuleWidth, capsuleHeight: capsuleHeight)
                ARCProgressBar(total: total, progress: 9.75, capsuleWidth: capsuleWidth, capsuleHeight: capsuleHeight)
                ARCProgressBar(total: total, progress: 1.25, capsuleWidth: capsuleWidth, capsuleHeight: capsuleHeight, emptyColor: Color.arcDarkGray, filledColor: Color.arcBlack)
            }
            .padding(.arcHorizontalPadding)
            .frame(maxHeight: .infinity)
        }
    }
}
