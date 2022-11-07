//
//  NutritionGuessParams.swift
//  HW_Networking
//
//  Created by Elina Semenko on 07.11.2022.
//

import Foundation

struct NutritionGuessParams: NetworkRequestBodyConvertible {
    var text: String

    var data: [String: String]? {
       ["title": text]
    }

    var queryItems: [URLQueryItem]? {
        [URLQueryItem(name: "title", value: text)]
    }

    var httpBody: [String : Any]?

    init(_ text: String) {
        self.text = text
    }
}
