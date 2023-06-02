//
//  FigmaShadow+Values.swift
//  ArcUI
//
//  Created by Ben Shutt on 19/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

public extension FigmaShadow {

    static let arcContainer = FigmaShadow(
        x: 0,
        y: 0,
        blur: 10,
        color: .arcBlack.opacity(0.15)
    )

    static let arcLightContainer = FigmaShadow(
        x: 0,
        y: 0,
        blur: 4,
        color: .arcBlack.opacity(0.15)
    )
}
