////
////  Tappable.swift
////  stargazers
////
////  Created by adinda pratiwi prameswari on 05/08/21.
////
//
//import SwiftUI
//
//struct Entry: Identifiable {
//    var id: String {
//        text
//    }
//    
//    let text: String
//    let def: String?
//    let index: Int?
//    
//    init(_ text: String) {
//        self.text = text
//        self.def = nil
//        self.index = nil
//    }
//    
//    init(_ text: String, def: String? = nil, index: Int? = nil) {
//        self.text = text
//        self.def = def
//        self.index = index
//    }
//}
//
//class Caller: ObservableObject {
//    
//    @Published var showingPopovers: [Bool] = []
//    
//    let entries: [Entry]
//    
//    init(entries: [Entry]) {
//        self.entries = entries
//        
//        for entry in entries {
//            if entry.def != nil { showingPopovers.append(false) }
//        }
//    }
//}
//
//struct Tappable: View {
//        
//    @StateObject var page = Caller(entries: [Entry("It is a very"),
//                              Entry("difficult", def: "hard", index: 0),
//                              Entry("task."),
//                              Entry("I am"),
//                              Entry("unable", def: "cannot", index: 1),
//                              Entry("to do it.")
//    ])
//    
//    var body: some View {
//        LazyHGrid(rows: [GridItem()]) {
//            ForEach(page.entries) { entry in
//                if let definition = entry.def {
//                    Button(entry.text) {
//                        page.showingPopovers[entry.index!] = true
//                    }
//                    .popover(isPresented: $page.showingPopovers[entry.index!]) {
//                        Text(definition)
//                            .font(.headline)
//                            .padding()
//                    }
//                } else {
//                    Text(entry.text)
//                }
//            }
//        }
//    }
//}
//
//struct Tappable_Previews: PreviewProvider {
//    static var previews: some View {
//        Tappable().landscape()
//    }
//}
//
