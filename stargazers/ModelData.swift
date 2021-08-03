//
//  ModelData.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
//    @Published var dashboards: [Structure]{
//        [
//        
//        ]
//    }
    
    @Published  var dashboards = {
        Structure(imageName: "SolarEclipse", tittleName: "Gerhana Matahari", subTittle: "Solar Eclipse")
    }
    
    @Published var infoCards = [
    
    
    ]
    
    
    @Published var simulations = []
}

//https://learnappmaking.com/pass-data-between-views-swiftui-how-to/

