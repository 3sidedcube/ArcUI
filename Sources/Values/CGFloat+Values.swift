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
    static let arcCornerRadius: CGFloat = 6
    static let arcBorder: CGFloat = 2

    struct ArcButton {

        static let border: CGFloat = 1
        static let padding: CGFloat = 14
        static let landscapeWidth: CGFloat = 336
        static let iconPadding: CGFloat = 6
        static let iconSize: CGFloat = 15
    }

    struct ArcListItem {

        static let spacing: CGFloat = 4
        static let chevronPadding: CGFloat = 24
        static let leadingPadding: CGFloat = 25
        static let trailingPadding: CGFloat = 16
        static let verticalPadding: CGFloat = 32
        static let verticalPaddingSubtitle: CGFloat = 26
        static let labelLeadingPadding: CGFloat = 6
    }

    struct ArcListItemSelectable {

        static let verticalPadding: CGFloat = 18
        static let horizontalPadding: CGFloat = 24
        static let checkboxHorizontalPadding: CGFloat = 24
        static let minHeight: CGFloat = 75
    }

    struct ArcLabel {

        static let verticalPadding: CGFloat = 4
        static let horizontalPadding: CGFloat = 8
    }

    struct ArcSelectable {

        static let padding: CGFloat = 12
        static let largePadding: CGFloat = 20
        static let spacing: CGFloat = 16
    }

    struct ArcImageCard {

        static let padding: CGFloat = 16
        static let footerVerticalPadding: CGFloat = 18
        static let imageHeight: CGFloat = 140
    }

    struct ArcPaginationButton {

        static let padding: CGFloat = 14
        static let trailingPadding: CGFloat = 12
        static let border: CGFloat = 1
    }

    struct ArcProgressBar {

        static let capsuleHeight: CGFloat = 10
        static let spacing: CGFloat = 8
    }

    struct ArcTitleImageCard {
        static let imageHeight: CGFloat = 120
        static let padding: CGFloat = 12
        static let subtitlePaddingTop: CGFloat = 8
    }
}

// MARK: - EdgeInsets + Values

public extension EdgeInsets {

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

    static let arcListItemSelectable = EdgeInsets(
        top: .ArcListItemSelectable.verticalPadding,
        leading: .ArcListItemSelectable.horizontalPadding,
        bottom: .ArcListItemSelectable.verticalPadding,
        trailing: .ArcListItemSelectable.horizontalPadding
    )

    static let arcLabel = EdgeInsets(
        top: .ArcLabel.verticalPadding,
        leading: .ArcLabel.horizontalPadding,
        bottom: .ArcLabel.verticalPadding,
        trailing: .ArcLabel.horizontalPadding
    )

    static let arcImageCardFooter = EdgeInsets(
        top: .ArcImageCard.footerVerticalPadding,
        leading: .ArcImageCard.padding,
        bottom: .ArcImageCard.footerVerticalPadding,
        trailing: .ArcImageCard.padding
    )

    static let arcPaginationButton = EdgeInsets(
        top: .ArcPaginationButton.padding,
        leading: .ArcPaginationButton.padding,
        bottom: .ArcPaginationButton.padding,
        trailing: .ArcPaginationButton.trailingPadding
    )
}
