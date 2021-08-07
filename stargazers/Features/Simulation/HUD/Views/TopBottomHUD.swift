//
//  TopBottomHUD.swift
//  stargazers
//
//  Created by Daniel Santoso on 05/08/21.
//

import SwiftUI

struct TopBottomHUD: View {
    var body: some View {
        VStack(alignment: .center) {
            Image("border atas")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
            Spacer()
            
            Image("border bawah")
                .resizable()
                .aspectRatio(contentMode: .fit)
            
        }
    }
}

struct TopBottomHUD_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            TopBottomHUD()
                .previewDevice(PreviewDevice(rawValue: "iPad Air (4th generation)"))
                .previewDisplayName("iPad Air (4th generation)")
                .landscape()
            TopBottomHUD()
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
                .previewDevice(PreviewDevice(rawValue: "iPad Air (4th generation)"))
                .previewDisplayName("iPad Air (4th generation)")
                .landscape()
        }
    }
}
