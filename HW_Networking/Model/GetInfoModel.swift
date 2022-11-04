//
//  GetInfoModel.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import Foundation

// MARK: - InfoModel
struct InfoModel: Codable {
    let vegetarian, vegan, glutenFree, dairyFree: Bool?
    let veryHealthy, cheap, veryPopular, sustainable: Bool?
    let weightWatcherSmartPoints: Int
    let gaps: String
    let lowFodmap, ketogenic, whole30: Bool?
    let servings: Int
    let sourceURL: String
    let spoonacularSourceURL: String?
    let aggregateLikes: Int
    let creditsText, sourceName: String
    let extendedIngredients: [ExtendedIngredient]
    let id: Int
    let title: String
    let readyInMinutes: Int
    let image: String
    let imageType, instructions: String

    enum CodingKeys: String, CodingKey {
        case vegetarian, vegan, glutenFree, dairyFree, veryHealthy, cheap, veryPopular, sustainable, weightWatcherSmartPoints, gaps, lowFodmap, ketogenic, whole30, servings
        case sourceURL = "sourceUrl"
        case spoonacularSourceURL = "spoonacularSourceUrl"
        case aggregateLikes, creditsText, sourceName, extendedIngredients, id, title, readyInMinutes, image, imageType, instructions
    }
}

// MARK: - ExtendedIngredient
struct ExtendedIngredient: Codable {
    let id: Int
    let aisle: String
    let image: String
    let name: String
    let amount: Double
    let unit, unitShort, unitLong, originalString: String?
    let meta: [String]
}

