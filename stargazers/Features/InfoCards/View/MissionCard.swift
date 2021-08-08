//
//  MissionCard.swift
//  stargazers
//
//  Created by adinda pratiwi prameswari on 05/08/21.
//

import SwiftUI

struct MissionCard: View {
    @EnvironmentObject var modelData: ModelData
    
    let adaptiveWidth = UIScreen.main.bounds.size.landscape().width * 0.617
    let adaptiveForButton = UIScreen.main.bounds.size.landscape().width * 0.191
    
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            VStack{
                Text("Misi Anda adalah:").frame(width: 800,alignment: .leading).font(.system(size: 32,design: .monospaced))
                Text("• Simulasikan Hujan Meteor Lyrids \n• Simulasikan Hujan Meteor Perseid \n• Simulasikan Hujan Meteor Geminid").frame(width: adaptiveWidth,alignment: .leading).font(.system(size: 32, weight: .medium,design: .monospaced))
            }
            
            NavigationLink(destination: HUDView(id: 0, simulation: modelData.simulations[1])){
                Image("StartButton")
                    .resizable()
                    .frame(width:adaptiveForButton,height:61)
                    .overlay(Text("Mulai Misi")
                                .foregroundColor(.white)
                                .font(.system(size: 24,design: .monospaced))
                                .fontWeight(.light)
                    )
            }.padding(.top,80)
            Spacer()
        }.foregroundColor(.white)
    }
}

struct MissionCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MissionCard().landscape()
        }
        .environmentObject(ModelData())
    }
}
