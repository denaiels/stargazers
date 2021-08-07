//
//  Dashboard.swift
//  stargazers
//
//  Created by Dhika Aditya Are on 05/08/21.
//

import SwiftUI
import UIKit

struct Dashboard: View {
    @EnvironmentObject var modelData: ModelData
    @State var currIndex: Int = 0
    @State var isCheck: Bool = false
    var body: some View {
        ZStack{
            Image("background")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .clipped()
                .foregroundColor(Color.white)
                .frame(width: UIScreen.main.bounds.size.landscape().width, height: UIScreen.main.bounds.size.landscape().height)
            
            HUD()
            
            ButtonSound(flagCheck: $isCheck)
            
            ButtonChevron(idx: $currIndex)
            
          
            ZStack{
                VStack(spacing: 32){
                    DataOnly(currIndex: $currIndex)
                    
                    //MARK: Navigation View
                    ZStack {
                        Image("StartButton3x")
                            .resizable()
                            .frame(width: 200, height: 60)
                        NavigationLink(destination: InfoCardsView()) {
                            Text("Mulai Misi")
                                .font(.system(size: 16, design: .monospaced))
                                .fontWeight(.light)
                                .foregroundColor(.white)
                                .foregroundColor(Color.white)
                        }
                    }
                }
            }
        }
        .statusBar(hidden: true)
        .edgesIgnoringSafeArea(.vertical)
        .navigationBarHidden(true)
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            Dashboard()
                .previewDevice("iPad Air (4th generation)")
                .landscape()
            Dashboard()
                .previewDevice("iPad Pro (9.7-inch)")
                .landscape()
            Dashboard()
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
                .landscape()
        }
        .environmentObject(ModelData())
    }
}


struct ButtonSound: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var flagCheck: Bool
    
    var body: some View {
        ZStack{
            VStack{
                HStack(){
                    Button(action: {
                        flagCheck = flagCheck == false ? true : false
                        if flagCheck == true{
                            playSound(sound: "A", type: "mp3")
                        }else{
                            stopSound(sound: "A", type: "mp3")
                        }
                    }){
                        Image(systemName: "speaker.wave.3")
                            .resizable()
                            .foregroundColor(Color.orange)
                            .frame(width: 32, height: 32)
                            .padding(.all, 32)
                    }
                    .frame(width: UIScreen.main.bounds.size.landscape().width, height: UIScreen.main.bounds.size.landscape().height, alignment: .topTrailing)
                }
                Spacer()
            }
        }
    }
}
