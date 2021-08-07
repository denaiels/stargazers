//
//  StatusHUD.swift
//  stargazers
//
//  Created by Daniel Santoso on 05/08/21.
//

import SwiftUI

struct StatusHUD: View {
    @ObservedObject var simulation: Simulation
    
    // MARK: - Dynamic Sizes
    let imageWidth = UIScreen.main.bounds.size.landscape().width * 0.332 // 454
    let statusSize = UIScreen.main.bounds.size.landscape().width * 0.0329
    let dateSize =  UIScreen.main.bounds.size.landscape().width * 0.0175 // 24
    let textPadding = (UIScreen.main.bounds.size.landscape().width * 0.332) * 0.06 // 27
    
    // MARK: - Views
    var body: some View {
        ZStack(alignment: .topLeading) {
            Image("HUD kiri bawah")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: imageWidth)
            
            VStack(alignment: .leading) {
                Text(simulation.phenomenonName)
                    .font(.system(size: statusSize, design: .monospaced))
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                 
                Text(simulation.status)
                    .font(.system(size: dateSize, design: .monospaced))
                    .fontWeight(.light)
                    .foregroundColor(.white)
                
            }
            .padding([.top, .leading], textPadding)
        }
    }
}

struct StatusHUD_Previews: PreviewProvider {
    
    static var previews: some View {
        Group {
            StatusHUD(simulation: Simulation(phenomenon: .meteorShower))
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
                .landscape()
//            StatusHUD(phenomenon: phenomena[1])
//                .previewDevice("iPad Air (4th generation)")
//                .landscape()
        }
    }
}
