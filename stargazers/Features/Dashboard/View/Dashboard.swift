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
            Rectangle()
                .foregroundColor(Color.black)
            
            
            ZStack{
                VStack(){
                    Image("frame atas")
                    Spacer()
                    Image("frame bawah")
                }
                .frame(width: UIScreen.main.bounds.size.landscape().width, height: UIScreen.main.bounds.size.landscape().height)
            }
            
            ZStack{
                VStack{
                    HStack(){
//                        Text("CakrawaLab Version 1.0")
//                            .foregroundColor(.white)
                        Button(action: {
                            isCheck = isCheck == false ? true : false
                            if isCheck == true{
                                playSound(sound: "A", type: "mp3")
                            }else{
                                stopSound(sound: "A", type: "mp3")
                            }
                        }){
                            //Spacer()
                            Image(systemName: "speaker.wave.3")
                                .foregroundColor(Color.orange)
                                .padding(.all, 60)
                                //MARK: Bug here
                                //.frame(width: UIScreen.main.bounds.size.landscape().width, height: UIScreen.main.bounds.size.landscape().height, alignment: .topTrailing)
                                .frame(width: 100, height: 100, alignment: .topTrailing)
                        }
                        
                        .frame(width: UIScreen.main.bounds.size.landscape().width, height: UIScreen.main.bounds.size.landscape().height, alignment: .topTrailing)
                    }
                    Spacer()
                }
                

                
            }
            
            ZStack{
                HStack(spacing: 900){
                    Button(action: {currIndex = currIndex > 0 ? currIndex-1 : modelData.dashboards.count-1}){
                        Image(systemName: "chevron.left")
                            .resizable()
                            .foregroundColor(Color.orange)
                            .frame(width: 32, height: 64)
                            .padding(.leading)
                    }
                    
                    Button(action: {currIndex = currIndex >= modelData.dashboards.count-1 ? 0 : currIndex+1}){
                        Image(systemName: "chevron.right")
                            .resizable()
                            .foregroundColor(Color.orange)
                            .frame(width: 32, height: 64)
                    }
                }
            }
            
            DataOnly(currIndex: $currIndex)
        }
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

struct DataOnly: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var currIndex: Int
    @State var xPosition: CGFloat = 0.0
    @State var yPosition: CGFloat = 0.0
    @State var degreePosition: Double = 0.0
    var body: some View {
        ZStack{
            VStack(){
                Image(modelData.dashboards[currIndex].imageName ?? "No Image")
                Text(modelData.dashboards[currIndex].titleName ?? "No Title").font(.title).bold()
                Text(modelData.dashboards[currIndex].subTittle ?? "No SubTitle").font(.callout)
            }
            .foregroundColor(Color.white)
        }
        .offset(x: xPosition, y: yPosition)
        .rotationEffect(.init(degrees: degreePosition))
        .gesture(
            DragGesture()
                .onChanged{ value in
                    withAnimation(.default){
                        xPosition = value.translation.width
                        yPosition = value.translation.height
                        degreePosition = 8 * (value.translation.width > 0 ? 1 : -1)
                        print("")
                        print(degreePosition)
                        print(xPosition)
                        print(yPosition)
                        print("")
                    }
                }
                
                .onEnded(){ value in
                    withAnimation(.interpolatingSpring(mass: 1.0, stiffness: 50, damping: 8, initialVelocity: 0)) {
                        switch value.translation.width {
                        case 0...100:
                            xPosition = 0; degreePosition = 0; yPosition = 0
                        case let x where x > 260:
                            //yPosition = 500; degreePosition = 12
                            xPosition = 0; degreePosition = 0; yPosition = 0
                            currIndex = currIndex > 0 ? currIndex-1 : modelData.dashboards.count-1
                            print("x lebih besar dari 100")
                        case (-100)...(-1):
                            //xPosition = 0; degreePosition = 0; yPosition = 0
                            print("balikin ke 0")
                        case let x where x < -215:
                            //xPosition  = -500; degreePosition = -12
                            xPosition = 0; degreePosition = 0; yPosition = 0
                            currIndex = currIndex >= modelData.dashboards.count-1 ? 0 : currIndex+1
                            print("posisi minus nih")
                        default:
                            xPosition = 0; yPosition = 0
                        }
                    }
                }
        )
    }
}
