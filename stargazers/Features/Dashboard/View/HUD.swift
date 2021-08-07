//
//  HUD.swift
//  stargazers
//
//  Created by Dhika Aditya Are on 05/08/21.
//

import SwiftUI

struct HUD: View {
    var body: some View {
        ZStack{
            VStack(){
                Image("frame atas")
                Spacer()
                Image("frame bawah")
            }
            .frame(width: UIScreen.main.bounds.size.landscape().width, height: UIScreen.main.bounds.size.landscape().height)
        }
    }
}

struct HUD_Previews: PreviewProvider {
    static var previews: some View {
        HUD()
    }
}


