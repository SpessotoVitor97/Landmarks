//
//  ModelData.swift
//  Landmarks
//
//  Created by Vitor Spessoto on 02/06/21.
//

import Foundation
import Combine

final class ModelData: ObservableObject {
    @Published var landmarks: [Landmark] = load("landmarkData")
    
    var hikes: [Hike] = load("hikeData")
    
    var features: [Landmark] {
        landmarks.filter{ $0.isFeatured }
    }
    
    var categories: [String: [Landmark]] {
        Dictionary(grouping: landmarks, by: { $0.category.rawValue})
    }
}

func load<T: Decodable>(_ filename: String, withExtension: String = ".json") -> T {
    let data: Data
    
    guard let file = Bundle.main.url(forResource: filename, withExtension: withExtension) else {
        fatalError("Couldn't find \(filename) in main bundle.")
    }
    
    do {
        data = try Data(contentsOf: file)
    } catch {
        fatalError("Couldn't load \(filename) in main bundle:\n\(error)")
    }
    
    do {
        let decoder = JSONDecoder()
        return try decoder.decode(T.self, from: data)
    } catch {
        fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
    }
}
