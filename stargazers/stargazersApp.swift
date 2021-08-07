//
//  stargazersApp.swift
//  stargazers
//
//  Created by Fabio Sim on 22/07/21.
//

import SwiftUI

@main
struct stargazersApp: App {
    @StateObject private var modelData = ModelData()
    
    var body: some Scene {
        let mainWindow = WindowGroup {
            ContentView()
                .environmentObject(modelData)
        }
        return mainWindow
    }
}
