//
//  ObjectivesHUD.swift
//  stargazers
//
//  Created by Daniel Santoso on 05/08/21.
//

import SwiftUI

struct ObjectivesHUD: View {
    @ObservedObject var simulation: Simulation
    
    // MARK: - Dynamic Sizes
    let imageWidth = UIScreen.main.bounds.size.landscape().width * 0.332 // 454
    let objectivesStackSpacing = UIScreen.main.bounds.size.landscape().width * 0.007 // 10
    let rowPadding = (UIScreen.main.bounds.size.landscape().width * 0.332) * 0.06 // 29
    
    // MARK: - Views
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Image("HUD kanan bawah")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth)
            
            VStack(alignment: .trailing, spacing: objectivesStackSpacing) {
                // Workaround for passing Bindings into ForEach: (iOS <15)
                ForEach(simulation.phenomena.indices) { idx in
                    ObjectiveRow(phenomenon: $simulation.phenomena[idx])
                }
            }
            .padding([.top, .trailing], rowPadding)
            
        }
    }
}

struct ObjectivesHUD_Previews: PreviewProvider {
//    static var modelData = ModelData()
    
    static var previews: some View {
        Group {
            ObjectivesHUD(simulation: Simulation(phenomenon: .meteorShower))
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
                .landscape()
//                .environmentObject(modelData)
//            ObjectivesHUD()
//                .previewDevice("iPad Air (4th generation)")
//                .landscape()
//                .environmentObject(modelData)
        }
    }
}
