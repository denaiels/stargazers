//
//  DataOnly.swift
//  stargazers
//
//  Created by Dhika Aditya Are on 05/08/21.
//

import SwiftUI

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
                    .resizable()
                    .frame(width: 400, height: 400)
                Text(modelData.dashboards[currIndex].titleName ?? "No Title")
                    .font(.system(size: 45, design: .monospaced))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                Text(modelData.dashboards[currIndex].subTittle ?? "No SubTitle")
                    .font(.system(size: 24, design: .monospaced))
                    .fontWeight(.light)
                    .foregroundColor(.white)
                
                //MARK: Navigation
                
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


/*
struct DataOnly_Previews: PreviewProvider {
    static var previews: some View {
        DataOnly(currIndex: <#Binding<Int>#>)
    }
}
 */
