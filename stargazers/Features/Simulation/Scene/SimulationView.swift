//
//  SimulationView.swift
//  stargazers
//
//  Created by Fabio Sim on 22/07/21.
//

import SwiftUI
import SpriteKit

struct SimulationView: View {
    @ObservedObject var simulation: Simulation
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            SpriteView(scene: simulation.solarSystemScene)
            
            SpriteView(scene: simulation.earthViewScene)
                .frame(width: UIScreen.main.bounds.size.landscape().width * 0.25,
                       height: UIScreen.main.bounds.size.landscape().height * 0.25)
                .border(Color.white)
            
            Text(simulation.status)
                .font(.title)
                .foregroundColor(.blue)
                .padding()
                .frame(maxWidth: .infinity, alignment: .topLeading)
        }
    }
}

struct SimulationView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SimulationView(simulation: Simulation(phenomenon: .meteorShower))
                .previewDevice("iPhone 12")
            SimulationView(simulation: Simulation(phenomenon: .meteorShower))
                .previewDevice("iPad Pro (9.7-inch)")
            SimulationView(simulation: Simulation(phenomenon: .meteorShower))
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
        }
        .landscape()
    }
}
