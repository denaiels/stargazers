//
//  DashboardView.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import SwiftUI

struct DashboardView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct DashboardView_Previews: PreviewProvider {
    static var previews: some View {
        DashboardView()
            .previewDevice("iPhone 12")
            .landscape()
    }
}
