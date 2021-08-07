//
//  ViewFromEarthHUD.swift
//  stargazers
//
//  Created by Daniel Santoso on 05/08/21.
//

import SwiftUI
import SpriteKit

struct ViewFromEarthHUD: View {
    
    @ObservedObject var simulation: Simulation
    
    // MARK: - Dynamic Sizes
    let imageWidth = UIScreen.main.bounds.size.landscape().width * 0.3484 // 476
    let fsBtnTrailingPadding = (UIScreen.main.bounds.size.landscape().width * 0.348) * 0.638 // 303
    let fsBtnTopPadding = (UIScreen.main.bounds.size.landscape().height * 0.211) * 0.72 // 207
    let fsBtnSize = UIScreen.main.bounds.size.landscape().width * 0.0271 // 37
    
    // MARK: - Views
    var body: some View {
        ZStack(alignment: .topTrailing) {
            SpriteView(scene: simulation.earthViewScene)
                .frame(width: UIScreen.main.bounds.size.landscape().width * 0.27,
                       height: UIScreen.main.bounds.size.landscape().height * 0.2)
            
            Image("HUD POV transparan")
                .resizable()
                .aspectRatio(contentMode: .fit)
                
            NavigationLink(destination:
                            SpriteView(scene: simulation.earthViewScene)
                            .statusBar(hidden: true)
                            .edgesIgnoringSafeArea(.vertical)
//                            .navigationBarHidden(true)
            ) {
                Image(systemName: "arrow.up.left.and.arrow.down.right")
                    .font(Font.system(size: fsBtnSize, weight: .light))
                    .padding(.trailing, fsBtnTrailingPadding)
                    .padding(.top, fsBtnTopPadding)
                    .foregroundColor(.primaryOrange)
            }
            
        }
        .frame(width: imageWidth)
    }
}

struct ViewFromEarthHUD_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ViewFromEarthHUD(simulation: Simulation(phenomenon: .solarEclipse))
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
                .landscape()
//            ViewFromEarthHUD()
//                .previewDevice("iPad Air (4th generation)")
//                .landscape()
        }
    }
}
