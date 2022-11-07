//
//  NetworkRequestBodyConvertible.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 01.11.2022.
//

import Foundation

protocol NetworkRequestBodyConvertible {
    var data: [String: String]? { get }
    var queryItems: [URLQueryItem]? { get }
    var httpBody: [String : Any]? { get }
}
