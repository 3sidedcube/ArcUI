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

    static let arcListItemHeight: CGFloat = 84
    static let arcListItemBorder: CGFloat = 2
    static let arcListItemLeadingPadding: CGFloat = 25
    static let arcListItemTrailingPadding: CGFloat = 16
}

// MARK: - EdgeInsets + Values

extension EdgeInsets {

    static let arcStickyContainer = EdgeInsets(
        top: .arcVerticalPadding,
        leading: .arcHorizontalPadding,
        bottom: .arcVerticalPadding,
        trailing: .arcHorizontalPadding
    )

    static let arcListItemContainer = EdgeInsets(
        top: 0,
        leading: .arcListItemLeadingPadding,
        bottom: 0,
        trailing: .arcListItemTrailingPadding
    )
}
