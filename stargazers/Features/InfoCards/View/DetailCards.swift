//
//  DetailCards.swift
//  stargazers
//
//  Created by adinda pratiwi prameswari on 04/08/21.
//

import SwiftUI

struct DetailCards: View {
    @State var showOverlay = false
    let index: Int
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            HStack{
                Text("Ketuk kata yang").italic() + Text(" disorot ").foregroundColor(.yellow).italic() + Text("untuk membuka penjelasan").italic()
            }.frame(width: 800,alignment: .leading)
            Image(inserted[index].image).resizable().frame(width: 800,height: 406).aspectRatio(contentMode: .fill)
//            HStack() {
//                ForEach(inserted[index].text.split(separator: "*"), id: \.self) { part in
//                    self.generateBlock(for: part)
//                }
//            }
            Text(inserted[index].text)
        }.frame(width:800,alignment: .leading)
    }
    
    private func generateBlock(for str: Substring) -> some View {
        Group {
            if str.starts(with: "~") {
                Text(str.dropFirst().dropLast(1))
                    .underline().foregroundColor(.blue).onTapGesture { self.showOverlay.toggle()}
                    .overlay(
                        ZStack {
                            if self.showOverlay {
                                Text("Tes").frame(width:200,height: 200).background(Color.blue)
                                    .onTapGesture {
                                        print("exit")
                                        self.showOverlay.toggle()
                                    }.padding(.bottom,300)
                            }
                        }
                    )
            }
            else {
                Text(str)
            }
        }
    }
}

struct DetailCards_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            DetailCards(index: 0).landscape()
            DetailCards(index: 0).previewDevice("iPad Pro (12.9-inch) (4th generation)").landscape()
        }
    }
}

