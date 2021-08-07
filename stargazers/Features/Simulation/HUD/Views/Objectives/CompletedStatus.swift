//
//  CompletedStatus.swift
//  stargazers
//
//  Created by Daniel Santoso on 05/08/21.
//

import SwiftUI

struct CompletedStatus: View {
    @Binding var isCompleted: Bool
    
    // MARK: - Dynamic Sizes
    let imageWidth = UIScreen.main.bounds.size.landscape().width * 0.332 // 454
    let checkboxSize = UIScreen.main.bounds.size.landscape().width * 0.0175 // 24
    let linePadding = UIScreen.main.bounds.size.landscape().width * 0.0036 // 5
    let lineWidth = UIScreen.main.bounds.size.landscape().width * 0.0878 // 120
    let lineHeight = UIScreen.main.bounds.size.landscape().width * 0.0175 // 24
    
    // MARK: - Views
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: isCompleted ? "checkmark.square" : "square")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: checkboxSize, height: checkboxSize)
                .foregroundColor(.white)
            
            Image(isCompleted ? "garis objective 2" : "garis objective")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .padding(.trailing, linePadding)
                .frame(width: lineWidth, height: lineHeight)
                
        }
    }
}

struct CompletedStatus_Previews: PreviewProvider {
    static var previews: some View {
        CompletedStatus(isCompleted: .constant(false))
            .landscape()
            .background(Color.black)
    }
}
