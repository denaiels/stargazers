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
        Structure(imageName: "HujanMeteor", titleName: "Hujan Meteor", subTittle: "Meteor Shower"),
        Structure(imageName: "GerhanaMatahari", titleName: "Gerhana Matahari", subTittle: "Solar Eclipse"),
        Structure(imageName: "HujanMeteor", titleName: "Dummy Title", subTittle: "Dummy SubTitle")
    ]
    
    @Published var infoCards = []
    @Published var simulations = []
}
