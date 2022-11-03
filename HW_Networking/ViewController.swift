//
//  ViewController.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 01.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak private var searchBar: UISearchBar!
    
    private var viewModel: HomeScreenDisplayable = HomeScreenViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.ownedVC = self
    }
    
    // pass here some fetched data, add it to view model:
    // recipeController.viewModel.somedata = passedData
    func showRecipeDetails() {
        guard let recipeController = self.storyboard?.instantiateViewController(withIdentifier: "RecipeViewController") as? RecipeViewController else { return }
        self.navigationController?.pushViewController(recipeController, animated: true)
    }
    
    // pass here some fetched data, add it to view model:
    // recipeController.viewModel.somedata = passedData
    func showNutritionDetails() {
        guard let nutritionController = self.storyboard?.instantiateViewController(withIdentifier: "NutritionViewController") as? NutritionDetailsViewController else { return }
        self.navigationController?.pushViewController(nutritionController, animated: true)
    }

    @IBAction func search(_ sender: Any) {
        // guard let text = searchBar.text else { return }
        // viewModel.search(text)
    }
    
    @IBAction func guess(_ sender: Any) {
        // guard let text = searchBar.text else { return }
        // viewModel.guess(text)
    }
}

