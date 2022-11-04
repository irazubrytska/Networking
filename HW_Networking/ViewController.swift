//
//  ViewController.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 01.11.2022.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak private var searchBar: UISearchBar!
    
    private var viewModel: HomeScreenDisplayable = HomeScreenViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.ownedVC = self

        tableView.dataSource = self
        tableView.delegate = self
    }
    
    // pass here some fetched data, add it to view model:
    // recipeController.viewModel.somedata = passedData
    func showRecipeDetails(_ recipeId: Int) {
        guard let recipeController = self.storyboard?.instantiateViewController(withIdentifier: "RecipeViewController") as? RecipeViewController else { return }
        recipeController.viewModel = RecipeViewModel(recipeId)
        self.navigationController?.pushViewController(recipeController, animated: true)
    }
    
    // pass here some fetched data, add it to view model:
    // recipeController.viewModel.somedata = passedData
    func showNutritionDetails() {
        guard let nutritionController = self.storyboard?.instantiateViewController(withIdentifier: "NutritionViewController") as? NutritionDetailsViewController else { return }
        self.navigationController?.pushViewController(nutritionController, animated: true)
    }

    @IBAction func search(_ sender: Any) {
         guard let text = searchBar.text else { return }
        Task {
            await viewModel.search(query: text)
        }
    }
    
    @IBAction func guess(_ sender: Any) {
        // guard let text = searchBar.text else { return }
        // viewModel.guess(text)
    }
}

// MARK: UITableViewDataSource

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.recipes.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(
            withIdentifier: String(describing: RecipeTableViewCell.self),
            for: indexPath
        ) as! RecipeTableViewCell

        guard let recipe = viewModel.recipes[safe: indexPath.row] else { return cell }
        cell.model = recipe
        return cell
    }

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let recipe = viewModel.recipes[safe: indexPath.row] else { return }
        viewModel.details(for: recipe.id)
    }
}

// MARK: UITableViewDelegate

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        300
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        searchBar.resignFirstResponder()
    }
}
