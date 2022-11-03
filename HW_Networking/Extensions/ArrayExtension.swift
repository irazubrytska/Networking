//
//  ArrayExtension.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 03.11.2022.
//

import Foundation

extension Array {
    subscript(safe index: Int) -> Element? {
        guard index < endIndex, index >= startIndex else { return nil }
        return self[index]
    }

    subscript(safe index: Int?) -> Element? {
        guard let index = index else { return nil }
        return self[safe: index]
    }
}
