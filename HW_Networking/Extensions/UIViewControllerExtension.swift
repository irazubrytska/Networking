//
//  UIViewControllerExtension.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 07.11.2022.
//

import UIKit

extension UIViewController {
    func showErrorAlert() {
        self.present(SearchErrorPresenter.showSearchError(), animated: true, completion: nil)
    }

    func showErrorAlert(title: String, message: String) {
        self.present(SearchErrorPresenter.showSearchError(title: title,
                                                          message: message), animated: true, completion: nil)
    }
}
