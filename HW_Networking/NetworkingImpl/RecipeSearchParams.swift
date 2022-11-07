//
//  RecipeSearchParams.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 03.11.2022.
//

import Foundation

struct RecipeSearchParams: NetworkRequestBodyConvertible {
    var text: String

    var data: [String: String]? {
        ["query": text]
    }

    var queryItems: [URLQueryItem]? {
        [URLQueryItem(name: "query", value: text)]
    }

    var httpBody: [String : Any]?

    init(_ text: String) {
        self.text = text
    }
}
