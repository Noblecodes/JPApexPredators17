//
//  ApexPredator.swift
//  JPApexPredators17
//
//  Created by Noble Udechukwu on 02/10/2024.
//

import Foundation
import SwiftUI

struct ApexPredator: Decodable, Identifiable{
    let id: Int
    let name: String
    let type : PredatorType
    let latitude: Double
    let longitude: Double
    let movies: [String]
    let movieScenes: [MovieScene]
    let link: String
    
    var image: String {
        name.lowercased().replacingOccurrences(of: " ", with: "")
    }
    
    struct MovieScene: Decodable {
        let id: Int
        let movie: String
        let sceneDescription: String
    }
}

enum PredatorType: String, Decodable, CaseIterable, Identifiable{
    case all
    case air
    case land
    case sea
    
    var id: PredatorType{
        self
    }
    
    var background: Color{
        switch self {
        case PredatorType.air:
                .teal
        case .land:
                .brown
        case .sea:
                .blue
        case .all:
                .black
        }
    }
    
    var icon: String{
        switch self {
        case .all:
            "square.stack.3d.up.fill"
        case .air:
            "leaf.fill"
        case .land:
            "wind"
        case .sea:
            "drop.fill"
        }
    }
}


