//
//  ButtonStyle.swift
//  stargazers
//
//  Created by Dhika Aditya Are on 06/08/21.
//

import Foundation
import SwiftUI

struct PrimaryButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding(5)
            .foregroundColor(configuration.isPressed ? Color.white.opacity(0.5) : .white)
            .overlay(
                RoundedRectangle(cornerRadius: 8)
                    .stroke(configuration.isPressed ? Color.orange.opacity(0.5) : .orange, lineWidth: 2)
            )
     }
}
