//
//  Image+Values.swift
//  ArcUI
//
//  Created by Vlad Bibire on 26/05/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

public extension Image {

    static let arcRoundedRightChevron = Image(media: "Arc-Rounded-Right-Chevron")
    static let arcRoundedRightChevronDisabled = Image(media: "Arc-Rounded-Right-Chevron-Disabled")
    static let arcListItemLeading = Image(media: "Arc-List-Item-Leading")
    static let arcEmptySelectable = Image(media: "Arc-Empty-Selectable")
    static let arcFilledRadio = Image(media: "Arc-Filled-Radio")
    static let arcFilledCheckbox = Image(media: "Arc-Filled-Checkbox")
    static let arcImageCardPreview = Image(media: "Arc-Image-Card-Preview")
    static let arcFilledRoundedCheckbox = Image(media: "Arc-Filled-Rounded-Checkbox")
    static let arcEmptyRoundedCheckbox = Image(media: "Arc-Empty-Rounded-Checkbox")
    static let arcPlusIcon = Image(media: "Arc-Plus-Icon")
}

// MARK: - Extensions

private extension Image {

    /// Initialize from module
    /// - Parameter media: Resource name
    init(media: String) {
        let uiImage = UIImage(named: media, in: .module, with: nil)
        guard let uiImage else {
            fatalError("Failed to load module \(Image.self) with name: '\(media)'")
        }
        self.init(uiImage: uiImage)
    }
}
