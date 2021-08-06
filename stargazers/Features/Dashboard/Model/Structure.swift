//
//  Structure.swift
//  stargazers
//
//  Created by Dhika Aditya Are on 02/08/21.
//

import Foundation
import UIKit

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


