//
//  RecipeViewModel.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import Foundation
import UIKit

protocol RecipeDisplayable {
    var ownedVC: RecipeViewController? { get set }
    var id: Int { get }

    func fetchInfo() async
}

class RecipeViewModel: RecipeDisplayable {
    private struct Constants {
        static let host = "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        static let headers = [
            "X-RapidAPI-Key": "ad2a9020damshc02c51879f0b9f2p18769ajsn4c11c5815975",
            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
        ]
        static let contentTypeHeader = [
            "content-type": "application/x-www-form-urlencoded"
        ]
    }

    var id: Int

    var info: InfoModel? {
        didSet {
            guard let info = info else {
                return
            }
            DispatchQueue.main.async {
                self.ownedVC?.configure(with: info)
            }
        }
    }

    var cuisine: CuisineModel? {
        didSet {
            guard let cuisine = cuisine else {
                return
            }
            DispatchQueue.main.async {
                self.ownedVC?.configure(with: cuisine)
            }
        }
    }

    weak var ownedVC: RecipeViewController?

    let network: Network<RecipesEndpoint> = .init(Constants.host,
                                                  headers: Constants.headers)

    init(_ id: Int) {
        self.id = id
    }

    func fetchInfo() async {
        do {
            let data = try await network.perform(.get, .information(id: id))
            self.info = try? JSONDecoder().decode(InfoModel.self, from: data)

            guard let ingredients = info?.extendedIngredients.map(\.name),
                  let title = info?.title else {
                return
            }

            let cuisineData = try await network.perform(.post, .classifyCuisine,
                                                        CuisineClassificationParams(ingredientList: ingredients, title: title))
            self.cuisine = try? JSONDecoder().decode(CuisineModel.self, from: cuisineData)
        }
        catch {
            // handle error
        }
    }
}
