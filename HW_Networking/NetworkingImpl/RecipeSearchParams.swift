//
//  RecipeSearchParams.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 03.11.2022.
//

import Foundation

struct RecipeSearchParams: NetworkRequestBodyConvertible {
    let data: Data?
    let queryItems: [URLQueryItem]?
    let parameters: [String : Any]?

    init(data: Data? = nil,
         queryItems: [URLQueryItem]? = nil,
         parameters: [String : Any]? = nil) {
        self.data = data
        self.queryItems = queryItems
        self.parameters = parameters
    }
}
