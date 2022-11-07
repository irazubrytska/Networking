//
//  NutritionDetailsViewController.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import UIKit

class NutritionDetailsViewController: UIViewController {
    var viewModel: NutritionDetailsDisplayable?
    
    @IBOutlet weak private var calories: UILabel!
    @IBOutlet weak private var carbs: UILabel!
    @IBOutlet weak private var fat: UILabel!
    @IBOutlet weak private var protein: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.ownedVC = self
        setupUI()
    }
    
    private func setupUI() {
        self.calories.text = String(viewModel?.nutrition.calories.value ?? 0) + (viewModel?.nutrition.calories.unit ?? "")
        self.carbs.text = String(viewModel?.nutrition.carbs.value ?? 0) + (viewModel?.nutrition.carbs.unit ?? "")
        self.fat.text = String(viewModel?.nutrition.fat.value ?? 0) + (viewModel?.nutrition.fat.unit ?? "")
        self.protein.text = String(viewModel?.nutrition.protein.value ?? 0) + (viewModel?.nutrition.protein.unit ?? "")
    }
}
