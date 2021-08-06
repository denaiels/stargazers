//
//  MissionCard.swift
//  stargazers
//
//  Created by adinda pratiwi prameswari on 05/08/21.
//

import SwiftUI

struct MissionCard: View {
    var body: some View {
        VStack(spacing: 10) {
            Spacer()
            VStack{
                Text("Misi Anda adalah:").frame(width: 800,alignment: .leading).font(.system(size: 32))
                Text("• Simulasikan Hujan Meteor Lyrids \n• Simulasikan Hujan Meteor Perseid \n• Simulasikan Hujan Meteor Geminid").frame(width: 800,alignment: .leading).font(.system(size: 32, weight: .medium))
            }
            
            Button(action:{print("Play gae") }){
                Image("start.button").resizable().frame(width:262,height:61).overlay(Text("Mulai Misi").foregroundColor(.white).font(.system(size: 32)))
            }.padding(.top,80)
            Spacer()
        }
    }
}

struct MissionCard_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MissionCard().landscape()
            MissionCard().previewDevice("iPad Pro (12.9-inch) (4th generation)").landscape()
        }
    }
}
