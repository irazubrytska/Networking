//
//  CuisineModel.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import Foundation

// MARK: - CuisineModel
struct CuisineModel: Codable {
    let cuisine: String
    let cuisines: [String]
    let confidence: Int
}
