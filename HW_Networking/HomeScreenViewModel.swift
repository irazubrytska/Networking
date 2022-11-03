//
//  HomeScreen.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import Foundation

protocol HomeScreenDisplayable {
    var ownedVC: ViewController? { get set }
    
    func search(query: String)
    // pass some parameter?
    func details()
    func guess(query: String)
}

class HomeScreenViewModel: HomeScreenDisplayable {
    weak var ownedVC: ViewController?
    
    func search(query: String) { }
    
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
