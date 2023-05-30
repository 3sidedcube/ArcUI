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

    // MARK: Headline

    static let arcH1 = TextStyle(
        font: .system,
        weight: 800,
        size: 36,
        lineHeight: 44,
        letter: -0.02,
        underline: false
    )

    static let arcH2 = TextStyle(
        font: .system,
        weight: 800,
        size: 21,
        lineHeight: 28,
        letter: -0.02,
        underline: false
    )

    static let arcH3 = TextStyle(
        font: .system,
        weight: 800,
        size: 18,
        lineHeight: 20,
        letter: 0.45,
        underline: false
    )

    static let arcH4 = TextStyle(
        font: .system,
        weight: 600,
        size: 15,
        lineHeight: 20,
        letter: 0.2,
        underline: false
    )

    // MARK: Sub

    static let arcSub1 = TextStyle(
        font: .system,
        weight: 500,
        size: 14,
        lineHeight: 16,
        letter: 0.13,
        underline: false
    )


    // MARK: Body

    static let arcBody1 = TextStyle(
        font: .system,
        weight: 400,
        size: 13,
        lineHeight: 16,
        letter: 0.2,
        underline: false
    )

    static let arcBody2 = TextStyle(
        font: .system,
        weight: 400,
        size: 13,
        lineHeight: 20,
        letter: 0.2,
        underline: false
    )

    // MARK: Overline
    static let arcOverline = TextStyle(
        font: .system,
        weight: 700,
        size: 12,
        lineHeight: 20,
        letter: 1.2,
        underline: false
    )

    // MARK: Button

    static let arcButton = TextStyle(
        font: .system,
        weight: 800,
        size: 13,
        lineHeight: 16,
        letter: 0.6,
        underline: false
    )

    // MARK: Label

    static let arcLabel = TextStyle(
        font: .system,
        weight: 700,
        size: 12,
        lineHeight: 14,
        letter: 0.12,
        underline: false
    )
}
