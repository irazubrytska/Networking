//
//  SearchErrorPresenter.swift
//  HW_Networking
//
//  Created by Elina Semenko on 07.11.2022.
//

import Foundation
import UIKit

enum SearchErrorPresenter {
    public static func showSearchError() -> UIAlertController {
        let alert = UIAlertController(title: "No Results", message: "Please, be more precise", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: nil))
        return alert
    }
}
