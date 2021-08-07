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
        Structure(imageName: "Hujanmeteor", titleName: "Hujan Meteor", subTittle: "Meteor Shower"),
        Structure(imageName: "GerhanaMatahari", titleName: "Gerhana Matahari", subTittle: "Solar Eclipse")
    ]
    
    @Published var infoCards = []
    
    var simulations = [Simulation(phenomenon: .solarEclipse), Simulation(phenomenon: .meteorShower)]
    
    @Published var phenomena: [Phenomenon] = [
        Phenomenon(id: 0, name: "-", isDone: false),
        Phenomenon(id: 1, name: "Geminids", isDone: false),
        Phenomenon(id: 2, name: "Perseids", isDone: false),
        Phenomenon(id: 3, name: "Lyrids", isDone: false)
    ]
}
