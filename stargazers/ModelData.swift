//
//  ModelData.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published  var dashboards = [
        Structure(imageName: "MeteorShower", titleName: "Hujan Meteor", subTittle: "Meteor Shower"),
        Structure(imageName: "SolarEclipse", titleName: "Gerhana Matahari", subTittle: "Solar Eclipse"),
        Structure(imageName: "MeteorShower", titleName: "Dummy Title", subTittle: "Dummy SubTitle")
    ]
    
    @Published var infoCards = [
    
    
    ]
    
    
    @Published var simulations = []
}

//https://learnappmaking.com/pass-data-between-views-swiftui-how-to/

