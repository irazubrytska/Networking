//
//  RecipesEndpoint.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 01.11.2022.
//

import Foundation

enum RecipesEndpoint: String, Endpoint {

    case analyzer = "recipes/analyzeInstructions"

    var pathComponent: String {
        rawValue
    }
}
