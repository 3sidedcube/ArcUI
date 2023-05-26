//
//  TextStyle+Values.swift
//  ArcUI
//
//  Created by Ben Shutt on 19/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI
import CubeFoundationSwiftUI

public extension TextStyle {

    static let arcButton = TextStyle(
        font: .system,
        weight: 800,
        size: 13,
        lineHeight: 16,
        letter: 0.6,
        underline: false
    )

    static let arcListItemTitle = TextStyle(
        font: .system,
        weight: 600,
        size: 15,
        lineHeight: 18,
        letter: 0.3,
        underline: false
    )

    static let arcListItemSubtitle = TextStyle(
        font: .system,
        weight: 400,
        size: 13,
        lineHeight: 16,
        letter: 0.3,
        underline: false
    )

    static let arcBadge = TextStyle(
        font: .system,
        weight: 700,
        size: 12,
        lineHeight: 14,
        letter: 0.12,
        underline: false
    )
}
