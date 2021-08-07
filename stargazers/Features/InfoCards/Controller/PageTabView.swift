//
//  PageTabView.swift
//  stargazers
//
//  Created by adinda pratiwi prameswari on 04/08/21.
//

import SwiftUI

struct PageTabView: View {
    @Binding var selection: Int
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    let adaptiveTopIndicator = UIScreen.main.bounds.size.landscape().width * 0.014
    let adaptiveLeadingIndicator = UIScreen.main.bounds.size.landscape().width * 0.050
    let adaptiveOffset = UIScreen.main.bounds.size.landscape().width * 0.058

    var body: some View {
            VStack {
                HStack {
                    indicatorPage(selection: $selection)
                        .padding(.top, adaptiveTopIndicator)
                        .padding(.leading, adaptiveLeadingIndicator)
                    Spacer()
                }
                
                HStack {
                    Spacer()
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }){
                        Image(systemName: "xmark").foregroundColor(.yellow).font(.system(size: 50))
                    }.offset(x: -adaptiveOffset, y: adaptiveOffset)
                }
                ZStack(){
                    if(selection == 4){
                        MissionCard()
                        
                    } else {
                        DetailCards(index: selection)
                    }
                    ButtonChevronCard(selection: $selection)
                }
            }
    }
}

struct indicatorPage : View {
    @Binding var selection: Int
    var body: some View{
        HStack(spacing: 0){
            ForEach((0...4), id: \.self){ index in
                if(selection == index){
                    Image("indicator.on").resizable()
                } else {
                    Image("indicator").resizable()
                }
            }.frame(width:80,height: 20)
        }
    }
}

struct ButtonChevronCard : View {
    let spacingAdaptive = UIScreen.main.bounds.size.landscape().width * 0.750
    @Binding var selection: Int
    var body: some View{
        ZStack(){
            HStack(spacing:spacingAdaptive){
                Button(action:{(selection == 0) ? selection = 0 : (selection -= 1)}){
                    Image(systemName: "chevron.left").foregroundColor(Color(#colorLiteral(red: 0.9765589833, green: 0.5821846128, blue: 0, alpha: 1))).frame(width: 100, height: 100).font(.system(size: 100))
                }
                Button(action:{(selection == 4) ? selection = 4 : (selection += 1)}){
                    Image(systemName: "chevron.right").foregroundColor(Color(#colorLiteral(red: 0.9765589833, green: 0.5821846128, blue: 0, alpha: 1))).frame(width: 100, height: 100).font(.system(size: 100))
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
