//
//  DetailCards.swift
//  stargazers
//
//  Created by adinda pratiwi prameswari on 04/08/21.
//

import SwiftUI

struct DetailCards: View {
    @State var showOverlay = false
    let adaptiveWidth = UIScreen.main.bounds.size.landscape().width * 0.617
    let index: Int
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            Spacer()
            HStack{
                Text("Ketuk kata yang").italic().font(.system(size: 16, design: .monospaced)) + Text(" disorot ").foregroundColor(.yellow).italic().font(.system(size: 16, design: .monospaced)) + Text("untuk membuka penjelasan").italic().font(.system(size: 16, design: .monospaced))
            }.frame(width: adaptiveWidth,alignment: .leading)
            Image(inserted[index].image).resizable().aspectRatio(contentMode: .fit)
//            HStack() {
//                ForEach(inserted[index].text.split(separator: "*"), id: \.self) { part in
//                    self.generateBlock(for: part)
//                }
//            }
            Text(inserted[index].text).frame(width:adaptiveWidth,alignment: .leading).font(.system(size: 16, design: .monospaced))
            Spacer()
        }.frame(width:adaptiveWidth,alignment: .leading).foregroundColor(.white)
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

