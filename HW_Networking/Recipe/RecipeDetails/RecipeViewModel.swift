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

    func fetchInfo()
}

class RecipeViewModel: RecipeDisplayable {

    var id: Int

    var info: InfoModel? {
        didSet {
            DispatchQueue.main.async {
                guard let info = self.info else {
                    self.ownedVC?.showErrorAlert(title: "We're sorry", message: "Could not load recipe details")
                    return
                }
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

    func fetchInfo() {
        Task {
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
            catch { }
        }
    }
}
