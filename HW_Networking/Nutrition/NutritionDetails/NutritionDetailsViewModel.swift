//
//  NutritionDetailsViewModel.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import Foundation
import UIKit

protocol NutritionDetailsDisplayable {
    var ownedVC: NutritionDetailsViewController? { get set }
    var nutrition: GuessNutritionResult { get set }
    var query: String? { get set }
}

class NutritionDetailsViewModel: NutritionDetailsDisplayable {
    weak var ownedVC: NutritionDetailsViewController?
    var nutrition: GuessNutritionResult
    var query: String?
    
    init(nutrition: GuessNutritionResult, query: String? = nil) {
        self.nutrition = nutrition
        self.query = query
    }
}
