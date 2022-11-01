//
//  RecipeAnalyzeInstruction.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 01.11.2022.
//

import Foundation

struct RecipeAnalyzeInstruction: NetworkRequestBodyConvertible {
    var text: String

    var data: Data? {
        "instructions=\(text)".data(using: .utf8)
    }
    var queryItems: [URLQueryItem]? { nil }

    var parameters: [String : Any]? {
        ["instructions" : text]
    }

    init(_ text: String) {
        self.text = text
    }
}
