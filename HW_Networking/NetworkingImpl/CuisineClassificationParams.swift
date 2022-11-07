//
//  CuisineClassificationParams.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 03.11.2022.
//

import Foundation

struct CuisineClassificationParams: NetworkRequestBodyConvertible {
    let ingredientList: [String]
    let title: String

    var data: [String: String]? {
        ["ingredientList": ingredientList.joined(separator: "\n"),
         "title": title]
    }

    var queryItems: [URLQueryItem]?

    var httpBody: [String : Any]? {
        ["ingredientList": ingredientList.joined(separator: "\n"),
         "title": title]
    }

    init(ingredientList: [String], title: String) {
        self.ingredientList = ingredientList
        self.title = title
    }
}
