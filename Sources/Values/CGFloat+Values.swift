//
//  CGFloat+Values.swift
//  ArcUI
//
//  Created by Ben Shutt on 19/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public extension CGFloat {

    static let arcButtonCorner: CGFloat = 6
    static let arcButtonBorder: CGFloat = 1
    static let arcButtonPadding: CGFloat = 14

    static let arcVerticalPadding: CGFloat = 16
    static let arcHorizontalPadding: CGFloat = 20
}

// MARK: - EdgeInsets + Values

extension EdgeInsets {

    static let arcStickyContainer = EdgeInsets(
        top: .arcVerticalPadding,
        leading: .arcHorizontalPadding,
        bottom: .arcVerticalPadding,
        trailing: .arcHorizontalPadding
    )
}
