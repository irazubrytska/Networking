//
//  HomeScreen.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import Foundation

protocol HomeScreenDisplayable {
    var ownedVC: ViewController? { get set }
    var recipes: [RecipeModel] { get set }

    func search(query: String) async
    func details(for recipeId: Int)
    func guess(query: String) async
}

class HomeScreenViewModel: HomeScreenDisplayable {

    weak var ownedVC: ViewController?

    let network: AlamoNetworking<RecipesEndpoint> = .init(Constants.host,
                                                  headers: Constants.headers)

    var recipes: [RecipeModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.ownedVC?.tableView.reloadData()
            }
        }
    }
    
    func search(query: String) async {
        do {
            let data = try await network.perform(.get,
                                                 .search,
                                                 RecipeSearchParams(query))
            let decoded = try JSONDecoder().decode(SearchModel.self, from: data)
            if decoded.results.isEmpty {
                await ownedVC?.showErrorAlert()
                return
            }
            self.recipes = decoded.results
        }
        catch {
            // handle error
            await ownedVC?.showErrorAlert()
        }
    }
    
    func details(for recipeId: Int) {
        ownedVC?.showRecipeDetails(recipeId)
    }
    
    func guess(query: String) async {
        // fetch
        do {
            let data = try await network.perform(.get,
                                                 .guessNutrition,
                                                 NutritionGuessParams(query))
            let decoded = try JSONDecoder().decode(GuessNutritionResult.self, from: data)
            // pass some fetched details
            await ownedVC?.showNutritionDetails(details: decoded, query: query)
        }
        catch {
            // handle error
            await ownedVC?.showErrorAlert()
        }
    }
}
