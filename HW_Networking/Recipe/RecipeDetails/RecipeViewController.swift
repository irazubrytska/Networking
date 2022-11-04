//
//  RecipeViewController.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import UIKit

class RecipeViewController: UIViewController {
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!
    @IBOutlet weak var servingsLabel: UILabel!
    @IBOutlet weak var cuisinesLabel: UILabel!

    var viewModel: RecipeDisplayable? {
        didSet {
            Task {
                await viewModel?.fetchInfo()
            }
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel?.ownedVC = self
    }

    func configure(with model: InfoModel) {
        imageView.sd_setImage(with: URL(string: model.image))
        titleLabel.text = model.title
        timeLabel.text = "Time: \(model.readyInMinutes) min"
        servingsLabel.text = "Servings: \(model.servings)"
    }

    func configure(with model: CuisineModel) {
        cuisinesLabel.text = "Cuisines: \(model.cuisines.joined(separator: ", "))"
    }
}
