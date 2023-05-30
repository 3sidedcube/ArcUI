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

    static let arcSelectablePadding: CGFloat = 12
    static let arcSelectableBorder: CGFloat = 2
    static let arcSelectableCorner: CGFloat = 6
    static let arcSelectableTitlePadding: CGFloat = 16

    static let arcListItemBorder: CGFloat = 2
    static let arcListItemSpacing: CGFloat = 4
    static let arcListItemChevronPadding: CGFloat = 24
    static let arcListItemLeadingPadding: CGFloat = 25
    static let arcListItemTrailingPadding: CGFloat = 16
    static let arcListItemVerticalPadding: CGFloat = 32
    static let arcListItemVerticalPaddingSubtitle: CGFloat = 26
    static let arcListItemBadgeLeadingPadding: CGFloat = 6

    static let arcBadgeVerticalPadding: CGFloat = 4
    static let arcBadgeHorizontalPadding: CGFloat = 8
    static let arcBadgeCorner: CGFloat = 6
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
        top: .arcListItemVerticalPadding,
        leading: .arcListItemLeadingPadding,
        bottom: .arcListItemVerticalPadding,
        trailing: .arcListItemTrailingPadding
    )

    static let arcListItemContainerSubtitle = EdgeInsets(
        top: .arcListItemVerticalPaddingSubtitle,
        leading: .arcListItemLeadingPadding,
        bottom: .arcListItemVerticalPaddingSubtitle,
        trailing: .arcListItemTrailingPadding
    )

    static let arcBadge = EdgeInsets(
        top: .arcBadgeVerticalPadding,
        leading: .arcBadgeHorizontalPadding,
        bottom: .arcBadgeVerticalPadding,
        trailing: .arcBadgeHorizontalPadding
    )
}
