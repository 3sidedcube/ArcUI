//
//  ARCSeparator.swift
//  ArcUI
//
//  Created by Ben Shutt on 27/06/2023.
//  Copyright © 2023 3 SIDED CUBE APP PRODUCTIONS LTD. All rights reserved.
//

import SwiftUI

struct ARCSeparator: View {

    var color: Color = .arcLightGray

    var body: some View {
        color
            .frame(height: .arcBorder)
    }
}

// MARK: - View + Extensions

public extension View {

    func arcSeparator(alignment: Alignment = .top) -> some View {
        self.overlay(ARCSeparator(), alignment: alignment)
    }
}
