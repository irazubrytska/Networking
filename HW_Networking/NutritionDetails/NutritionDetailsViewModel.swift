//
//  NutritionDetailsViewModel.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import Foundation
import UIKit

protocol NutritionDetailsDisplayable {
    var ownedVC: UIViewController? { get set }
}

class NutritionDetailsViewModel: NutritionDetailsDisplayable {
    weak var ownedVC: UIViewController?
}
