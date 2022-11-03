//
//  RecipeViewModel.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import Foundation
import UIKit

protocol RecipeDisplayable {
    var ownedVC: UIViewController? { get set }
}

class RecipeViewModel: RecipeDisplayable {
    weak var ownedVC: UIViewController?
}
