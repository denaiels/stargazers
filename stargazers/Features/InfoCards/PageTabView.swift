//
//  PageTabView.swift
//  stargazers
//
//  Created by adinda pratiwi prameswari on 04/08/21.
//

import SwiftUI

struct PageTabView: View {
    @Binding var selection: Int
    var body: some View {
        VStack {
            indicatorPage(selection: $selection)
            HStack(){
                Button(action:{(selection == 0) ? selection = 0 : (selection -= 1)}){
                    Image(systemName: "chevron.left").foregroundColor(.white).frame(width: 200, height: 100).font(.system(size: 100))
                }
                HStack{
                    if(selection == 4){
                        MissionCard()
                    } else {
                            DetailCards(index: selection)
                    }
                }
                Button(action:{(selection == 4) ? selection = 4 : (selection += 1)}){
                    Image(systemName: "chevron.right").foregroundColor(.white).frame(width: 200, height: 100).font(.system(size: 100))
                }
            }.frame(width: 900, height: 600)
        }
    }
}

struct indicatorPage : View {
    @Binding var selection: Int
    var body: some View{
        HStack{
            ForEach((0...4), id: \.self){ index in
                if(selection == index){
                    Image("indicator.on")
                } else {
                    Image("indicator")
                }
            }
        }
    }
}

struct PageTabView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            PageTabView(selection: Binding.constant(0)).landscape()
            PageTabView(selection: Binding.constant(0)).previewDevice("iPad Pro (12.9-inch) (4th generation)").landscape()
        }
    }
}
