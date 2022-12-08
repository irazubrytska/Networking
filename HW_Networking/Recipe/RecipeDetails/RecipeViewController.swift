//
//  RecipeViewController.swift
//  HW_Networking
//
//  Created by Elina Semenko on 03.11.2022.
//

import UIKit

class RecipeViewController: UIViewController {
    @IBOutlet weak private var imageView: UIImageView!
    @IBOutlet weak private var titleLabel: UILabel!
    @IBOutlet weak private var timeLabel: UILabel!
    @IBOutlet weak private var servingsLabel: UILabel!
    @IBOutlet weak private var cuisinesLabel: UILabel!
    @IBOutlet weak private var recipeTextView: UITextView!
    
    var viewModel: RecipeDisplayable? {
        didSet {
            viewModel?.fetchInfo()
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
        
        recipeTextView.text = model.instructions
    }

    func configure(with model: CuisineModel) {
        cuisinesLabel.text = "Cuisines: \(model.cuisines.joined(separator: ", "))"
    }
}
