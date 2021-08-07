//
//  InfoCardsView.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import SwiftUI

struct InfoCardsView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @State var selection = 0
    var body: some View {
        ZStack(alignment: .top){
            Color(#colorLiteral(red: 0.00527537521, green: 0.003872103523, blue: 0.1063141897, alpha: 1)).ignoresSafeArea()
            HUD()
            VStack{
                PageTabView(selection: $selection)
            }
            
        }
        .navigationBarHidden(true)
        //        .navigationBarBackButtonHidden(true)
    }
}

struct InfoCardsView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InfoCardsView().landscape()
            InfoCardsView().previewDevice("iPad Pro (12.9-inch) (4th generation)").landscape()
        }
    }
}
