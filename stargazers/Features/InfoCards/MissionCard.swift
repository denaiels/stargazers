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
            Color(inserted[2].image).frame(width: 800 , height: 400)
            Text("Misi Anda, jika Anda memilih untuk menerimanya:").frame(width: 800,alignment: .leading)
            Text("• Simulasikan Hujan Meteor Lyrids \n• Simulasikan Hujan Meteor Perseid \n• Simulasikan Hujan Meteor Geminid").frame(width: 800,alignment: .leading)
            Button(action:{print("Play gae") }){
                Image("indicator").resizable().frame(width:150,height:50)
            }
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
