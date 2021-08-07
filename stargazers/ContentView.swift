//
//  ContentView.swift
//  stargazers
//
//  Created by Fabio Sim on 22/07/21.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            Dashboard()
                .navigationBarHidden(true)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ModelData())
    }
}
