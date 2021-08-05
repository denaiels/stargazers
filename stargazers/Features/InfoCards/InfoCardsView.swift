//
//  InfoCardsView.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import SwiftUI

struct InfoCardsView: View {
    @State var selection = 0
    var body: some View {
        ZStack(){
            Color.gray.ignoresSafeArea()
            VStack{
                HStack(){
                    Spacer()
                    Button(action: {print("Exit")}){
                        Image(systemName: "xmark").foregroundColor(.white).font(.system(size: 50))
                    }
                }.frame(width:900)
                PageTabView(selection: $selection)
            }
            
        }
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
