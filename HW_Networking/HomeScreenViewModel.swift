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

    func search(query: String)
    // pass some parameter?
    func details()
    func guess(query: String)
}

class HomeScreenViewModel: HomeScreenDisplayable {
    private struct Constants {
        static let host = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        static let headers = [
            "X-RapidAPI-Key": "ad2a9020damshc02c51879f0b9f2p18769ajsn4c11c5815975",
            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
    }

    weak var ownedVC: ViewController?

    let network: Network<RecipesEndpoint> = .init(Constants.host,
                                                  headers: Constants.headers)

    var recipes: [RecipeModel] = [] {
        didSet {
            DispatchQueue.main.async {
                self.ownedVC?.tableView.reloadData()
            }
        }
    }
    
    func search(query: String) {
        network.perform(.get,
                        .search,
                        RecipeSearchParams(queryItems: [.init(name: "query", value: query)])
        ) { [weak self] result in
            switch result {
            case .data(let data):
                if let data = data,
                   let decoded = try? JSONDecoder().decode(SearchModel.self, from: data) {
                    self?.recipes = decoded.results
                }
            case .error(_):
                // handle error
                break
            }
        }
    }
    
    func details() {
        // fetch
        // pass some fetched details
        ownedVC?.showRecipeDetails()
    }
    
    func guess(query: String) {
        // fetch
        // pass some fetched details
        ownedVC?.showNutritionDetails()
    }
}
