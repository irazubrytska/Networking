//
//  RequestUsageExample.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 03.11.2022.
//

import Foundation

// TODO: Delete

// //       let url = URL(string: "https://spoonacular-recipe-food-nutrition-v1.p.rapidapi.com/recipes/complexSearch?query=pasta")
//
//        let headers = [
//            "X-RapidAPI-Key": "ad2a9020damshc02c51879f0b9f2p18769ajsn4c11c5815975",
//            "X-RapidAPI-Host": "spoonacular-recipe-food-nutrition-v1.p.rapidapi.com"
//        ]
//
//        let network = Network<RecipesEndpoint>("spoonacular-recipe-food-nutrition-v1.p.rapidapi.com", headers: headers)
//
//
//        var searchParams = RecipeSearchParams()
//        searchParams.queryItems = [URLQueryItem(name: "query", value: "pasta")]
//
//        network.perform(.get, .search, searchParams) { [weak self] result in
//            switch result {
//            case .data(let data):
//                if let data = data,
//                   let decoded = try? JSONDecoder().decode(SearchModel.self, from: data) {
//                    print("qqqq DATA \(decoded)")
//            }
//            case .error(let error):
//                print("qqqq ERROR \(error.localizedDescription)")
//            }
//        }
