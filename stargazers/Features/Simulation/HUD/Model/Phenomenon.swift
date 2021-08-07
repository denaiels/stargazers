//
//  Phenomenon.swift
//  stargazers
//
//  Created by Daniel Santoso on 05/08/21.
//

import Foundation

struct Phenomenon: Hashable, Codable, Identifiable {
    var id: Int
    var name: String
    var isDone: Bool
}
