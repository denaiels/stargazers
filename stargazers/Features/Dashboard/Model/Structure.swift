//
//  Structure.swift
//  stargazers
//
//  Created by Dhika Aditya Are on 02/08/21.
//

import Foundation
import UIKit

//struct Structure: Identifiable{
//    let id = UUID()
//    let imageName: String
//    let titleName: String
//    let subTittle: String
//    let modePhase1: String
//    let modePhase2: String
//    let modePhase3: String
//
////    var x: CGFloat = 0.0
////    var y: CGFloat = 0.0
////    var degree: Double = 0.0 //card rotation
//
//    static var data: [Structure]{
//        [
//            Structure(imageName: "SolarEclipse", titleName: "Gerhana Matahari", subTittle: "Solar Eclipse", modePhase1: "Partial", modePhase2: "Cincin", modePhase3: "Gatau"),
//            Structure(imageName: "MeteorShower", titleName: "Hujan Meteor", subTittle: "Meteor Shower", modePhase1: "blabla", modePhase2: "Leonid", modePhase3: "blabla")
//        ]
//    }
//}

//class Structure: Identifiable, ObservableObject{
//    @Published var id = UUID()
//    @Published var imageName: String?
//    @Published var titleName: String?
//    @Published var subTittle: String?
//
//    init(imageName: String, tittleName: String, subTittle: String) {
//        self.imageName = imageName
//        self.titleName = titleName
//        self.subTittle = subTittle
//    }
//}

class Structure: Identifiable{
   var id = UUID()
    var imageName: String?
    var titleName: String?
    var subTittle: String?
    
//    //MARK: Positioning Gesture Card
//    var x: CGFloat = 0.0
//    var y: CGFloat = 0.0
//    //MARK: Rotation Angle
//    var degree: Double = 0.0
    
    
    init(imageName: String, titleName: String, subTittle: String) {
        self.imageName = imageName
        self.titleName = titleName
        self.subTittle = subTittle
    }
}


