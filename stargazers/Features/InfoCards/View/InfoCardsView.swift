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
        ZStack(){
            Color.gray.ignoresSafeArea()
            VStack{
                HStack(){
                    Spacer(minLength: 10)
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "xmark").foregroundColor(.white).font(.system(size: 50))
                    }
                }.padding([.top,.trailing],80)
                PageTabView(selection: $selection)
                Spacer()
            }
        }
        .navigationBarBackButtonHidden(true)
        
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
