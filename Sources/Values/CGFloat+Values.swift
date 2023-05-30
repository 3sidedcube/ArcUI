//
//  CGFloat+Values.swift
//  ArcUI
//
//  Created by Ben Shutt on 19/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public extension CGFloat {

    static let arcVerticalPadding: CGFloat = 16
    static let arcHorizontalPadding: CGFloat = 20

    struct ArcButton {
        static let cornerRadius: CGFloat = 6
        static let border: CGFloat = 1
        static let padding: CGFloat = 14
    }

    struct ArcListItem {
        static let border: CGFloat = 2
        static let spacing: CGFloat = 4
        static let chevronPadding: CGFloat = 24
        static let leadingPadding: CGFloat = 25
        static let trailingPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 32
        static let verticalPaddingSubtitle: CGFloat = 26
        static let badgeLeadingPadding: CGFloat = 6
    }

    struct ArcBadge {
        static let verticalPadding: CGFloat = 4
        static let horizontalPadding: CGFloat = 8
        static let cornerRadius: CGFloat = 6
    }
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
        top: .ArcListItem.verticalPadding,
        leading: .ArcListItem.leadingPadding,
        bottom: .ArcListItem.verticalPadding,
        trailing: .ArcListItem.trailingPadding
    )

    static let arcListItemContainerSubtitle = EdgeInsets(
        top: .ArcListItem.verticalPaddingSubtitle,
        leading: .ArcListItem.leadingPadding,
        bottom: .ArcListItem.verticalPaddingSubtitle,
        trailing: .ArcListItem.trailingPadding
    )

    static let arcBadge = EdgeInsets(
        top: .ArcBadge.verticalPadding,
        leading: .ArcBadge.horizontalPadding,
        bottom: .ArcBadge.verticalPadding,
        trailing: .ArcBadge.horizontalPadding
    )
}
