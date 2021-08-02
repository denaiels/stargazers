//
//  ViewLandscape.swift
//  stargazers
//
//  Created by Dhika Aditya Are on 02/08/21.
//

import SwiftUI

struct ViewLandscape: ViewModifier {
    let height = UIScreen.main.bounds.width
    let width = UIScreen.main.bounds.height

    var isPad: Bool {
        return height >= 768
    }

    var isRegularWidth: Bool {
        return height >= 414
    }

    func body(content: Content) -> some View {
        content
            .previewLayout(.fixed(width: width, height: height))
            .environment(\.horizontalSizeClass, isRegularWidth ? .regular: .compact)
            .environment(\.verticalSizeClass, isPad ? .regular: .compact)
    }
}

extension View {
    func landscape() -> some View {
        self.modifier(ViewLandscape())
    }
}
