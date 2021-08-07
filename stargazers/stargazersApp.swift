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
    @StateObject private var modelDataHUD = ModelDataHUD()
    
    var body: some Scene {
        let mainWindow = WindowGroup {
            ContentView()
                .environmentObject(modelData)
                .environmentObject(modelDataHUD)
        }
        return mainWindow
    }
}
