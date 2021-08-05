//
//  DetailCards.swift
//  stargazers
//
//  Created by adinda pratiwi prameswari on 04/08/21.
//

import SwiftUI

struct DetailCards: View {
    let index: Int
    var body: some View {
        VStack(alignment: .leading,spacing: 25) {
            Text("Ketuk kata yang disorot untuk membuka penjelasan").italic().frame(width: 800,alignment: .leading)
            Color(inserted[index].image).frame(width: 800 , height: 400)
            Text(inserted[index].text).frame(width: 800,alignment: .leading)
        }
    }
}

struct DetailCards_Previews: PreviewProvider {
    static var previews: some View {
        DetailCards(index: 0).landscape()
    }
}
