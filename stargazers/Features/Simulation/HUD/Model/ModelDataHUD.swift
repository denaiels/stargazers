//
//  ModelDataHUD.swift
//  stargazers
//
//  Created by Daniel Santoso on 05/08/21.
//

import Foundation
import Combine

final class ModelDataHUD: ObservableObject {
    
    @Published var phenomena: [Phenomenon] = [
        Phenomenon(id: 0, name: "-", isDone: false),
        Phenomenon(id: 1, name: "Geminids", isDone: true),
        Phenomenon(id: 2, name: "Perseids", isDone: true),
        Phenomenon(id: 3, name: "Lyrids", isDone: false)
    ]
    
}

