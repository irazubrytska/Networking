//
//  RecipeViewController.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import UIKit

class RecipeViewController: UIViewController {
    
    var viewModel: RecipeDisplayable = RecipeViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.ownedVC = self
    }
}
