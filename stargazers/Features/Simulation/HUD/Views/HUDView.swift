//
//  HUDView.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import SwiftUI
import SpriteKit

struct HUDView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    
    @EnvironmentObject var modelData: ModelData
    
    var id: Int
    var phenomenon: Phenomenon {
        modelData.phenomena.first(where: {
            $0.id == id
        })!
    }
    
    @ObservedObject var simulation: Simulation
    
    // MARK: - Dynamic Sizes
    let backBtnSize = UIScreen.main.bounds.size.landscape().width * 0.0585 // 80
    let backBtnLeadingPadding = UIScreen.main.bounds.size.landscape().width * 0.0307 // 42
    let backBtnTopPadding = UIScreen.main.bounds.size.landscape().width * 0.0512 // 70
    
    
    // MARK: - Views
    var body: some View {
        ZStack(alignment: .center) {
            SpriteView(scene: simulation.solarSystemScene)
            
            TopBottomHUD()
            
            VStack {
                HStack(alignment: .top) {
                    Button(action: {
                        self.presentationMode.wrappedValue.dismiss()
                    }) {
                        Image(systemName: "chevron.backward")
                            .font(Font.system(size: backBtnSize, weight: .light))
                            .foregroundColor(.primaryOrange)
                    }
                    .padding(.leading, backBtnLeadingPadding)
                    .padding(.top, backBtnTopPadding)
                    
                    Spacer()
                    
                    ViewFromEarthHUD(simulation: simulation)
                }
                
                Spacer()
                
                HStack(alignment: .bottom) {
                    StatusHUD(simulation: simulation)
                    
                    Spacer()
                    
                    ObjectivesHUD(simulation: simulation)
                }
                
            }
        }
        .statusBar(hidden: true)
        .edgesIgnoringSafeArea(.vertical)
        .navigationBarHidden(true)
    }
}

struct HUDView_Previews: PreviewProvider {
    static var modelData = ModelData()
    
    static var previews: some View {
        Group {
            HUDView(id: 0, simulation: Simulation(phenomenon: .solarEclipse))
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
                .landscape()
//            HUDView(id: 1)
//                .previewDevice("iPad Air (4th generation)")
//                .landscape()
//            HUDView(id: 2)
//                .previewDevice("iPad Pro (11-inch) (3rd generation)")
//                .landscape()
//            HUDView(id: 0)
//                .previewDevice("iPad Pro (11-inch) (3rd generation)")
//                .landscape()
        }
        .environmentObject(modelData)
    }
}


