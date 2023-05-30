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

    static let arcSelectable = TextStyle(
        font: .system,
        weight: 600,
        size: 15,
        lineHeight: 20,
        letter: 0.2,
        underline: false
    )
}
