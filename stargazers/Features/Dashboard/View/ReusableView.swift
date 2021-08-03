//
//  ReusableView.swift
//  stargazers
//
//  Created by Dhika Aditya Are on 03/08/21.
//

import SwiftUI

struct ReusableView: View {
    var body: some View {
        Text("dd")
        //PrimaryButtonStyle(
    }
}

struct ReusableView_Previews: PreviewProvider {
    static var previews: some View {
        ReusableView()
    }
}

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
