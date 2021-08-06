//
//  ButtonChevron.swift
//  stargazers
//
//  Created by Dhika Aditya Are on 05/08/21.
//

import SwiftUI

struct ButtonChevron: View {
    @EnvironmentObject var modelData: ModelData
    @Binding var idx: Int
    
    var body: some View {
        ZStack{
            HStack(spacing: 900){
                Button(action: {idx = idx > 0 ? idx-1 : modelData.dashboards.count-1}){
                    Image(systemName: "chevron.left")
                        .resizable()
                        .foregroundColor(Color.orange)
                        .frame(width: 32, height: 64)
                        .padding(.leading)
                }
                
                Button(action: {idx = idx >= modelData.dashboards.count-1 ? 0 : idx+1}){
                    Image(systemName: "chevron.right")
                        .resizable()
                        .foregroundColor(Color.orange)
                        .frame(width: 32, height: 64)
                }
            }
        }
    }
}

struct ButtonChevron_Previews: PreviewProvider {
    static var previews: some View {
        ButtonChevron(idx: .constant(0))
            .previewDevice("iPad Air (4th generation)")
            .landscape()
    }
}
