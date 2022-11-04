//
//  RecipesEndpoint.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 01.11.2022.
//

import Foundation

enum RecipesEndpoint: Endpoint {
    case search
    case information(id: Int)
    case guessNutrition
    case classifyCuisine

    var pathComponent: String {
        switch self {
        case .search:
            return "/recipes/complexSearch"
        case .information(let id):
            return "/recipes/\(id)/information"
        case .guessNutrition:
            return "/recipes/guessNutrition"
        case .classifyCuisine:
            return "/recipes/cuisine"
        }
    }
}
