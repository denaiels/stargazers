//
//  ObjectiveRow.swift
//  stargazers
//
//  Created by Daniel Santoso on 05/08/21.
//

import SwiftUI

struct ObjectiveRow: View {
    @EnvironmentObject var modelData: ModelDataHUD
    var phenomenon: Phenomenon
    var phenomenaIndex: Int {
        modelData.phenomena.firstIndex(where: {
            $0.id == phenomenon.id
        })!
    }
    
    // MARK: - Dynamic Sizes
    let imageWidth = UIScreen.main.bounds.size.landscape().width * 0.332 // 454
    let textSize = UIScreen.main.bounds.size.landscape().width * 0.0175 // 24
    let textMinWidth = UIScreen.main.bounds.size.landscape().width * 0.0944 // 129
    let rowWidth = (UIScreen.main.bounds.size.landscape().width * 0.332) * 0.649 // 295
    let rowHeight = (UIScreen.main.bounds.size.landscape().height * 0.178) * 0.158 // 29
    
    // MARK: - Views
    var body: some View {
        HStack(alignment: .center) {
            Text(phenomenon.name)
                .font(.system(size: textSize, design: .monospaced))
                .fontWeight(.regular)
                .foregroundColor(.white)
                .frame(minWidth: textMinWidth, alignment: .leading)
            
            CompletedStatus(isCompleted: $modelData.phenomena[phenomenaIndex].isDone)
            
        }
        .frame(
            width: rowWidth,
            height: rowHeight
        )
    }
}

struct ObjectiveRow_Previews: PreviewProvider {
    static var modelData = ModelDataHUD()
    
    static var previews: some View {
        Group {
            ObjectiveRow(phenomenon: modelData.phenomena[1])
                .previewDevice("iPad Pro (12.9-inch) (5th generation)")
                .landscape()
                .background(Color.black)
                .environmentObject(modelData)
            ObjectiveRow(phenomenon: modelData.phenomena[1])
                .previewDevice("iPad Air (4th generation)")
                .landscape()
                .background(Color.black)
                .environmentObject(modelData)
        }
    }
}
