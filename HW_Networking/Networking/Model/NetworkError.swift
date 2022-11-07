//
//  NetworkError.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 01.11.2022.
//

import Foundation

enum NetworkError: Error {
    case badHostString
    case requestPerformingError
    case requestFormingError
}
