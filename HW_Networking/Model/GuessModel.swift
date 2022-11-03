//
//  GuessModel.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import Foundation

// MARK: - Guess the macro nutrients of a dish given its title.

// MARK: - GuessNutritionResult
struct GuessNutritionResult: Codable {
    let recipesUsed: Int
    let calories, fat, protein, carbs: Nutrition
}

// MARK: - Nutrition
struct Nutrition: Codable {
    let value: Int
    let unit: String
    let confidenceRange95Percent: ConfidenceRange95Percent
    let standardDeviation: Double
}

// MARK: - ConfidenceRange95Percent
struct ConfidenceRange95Percent: Codable {
    let min, max: Double
}
