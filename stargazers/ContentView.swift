//
//  ContentView.swift
//  stargazers
//
//  Created by Fabio Sim on 22/07/21.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var modelData: ModelData
    
    var body: some View {
        NavigationView {
            Dashboard()
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .landscape()
            .environmentObject(ModelData())
    }
}
