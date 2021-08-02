//
//  ModelData.swift
//  stargazers
//
//  Created by Fabio Sim on 02/08/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var dashboards = []
    
    @Published var infoCards = []
    
    @Published var simulations = []
}
