//
//  JSONLoader.swift
//  stargazers
//
//  Created by Fabio Sim on 22/07/21.
//

import Foundation

/** Loads a JSON file into Codable object(s).
- Parameter filename: The JSON file name as a String.
- Returns: Decoded object of type T.

Use this function as follows.
 ```
 var questions: [Question] = load("questionData.json")
 ```
 */
func load<T: Decodable>(_ filename: String) -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: nil)
    else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
