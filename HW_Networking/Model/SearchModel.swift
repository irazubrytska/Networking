//
//  SearchModel.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import Foundation

// MARK: - SearchModel
struct SearchModel: Codable {
    let results: [RecipeModel]
}

struct RecipeModel: Codable {
    let id: Int
    let image: URL?
    let title: String
}
