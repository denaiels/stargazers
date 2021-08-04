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
        Structure(imageName: "MeteorShower", titleName: "Meteor Shower", subTittle: "Hujan Meteor"),
        Structure(imageName: "SolarEclipse", titleName: "Solar Eclipse", subTittle: "Gerhana"),
        Structure(imageName: "MeteorShower", titleName: "asdf", subTittle: "asdfd")
    ]
    
    @Published var infoCards = [
    
    
    ]
    
    
    @Published var simulations = []
}

//https://learnappmaking.com/pass-data-between-views-swiftui-how-to/

