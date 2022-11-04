//
//  RecipeTableViewCell.swift
//  HW_Networking
//
//  Created by Iryna Zubrytska on 03.11.2022.
//

import UIKit
import SDWebImage

class RecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var recipeImageView: UIImageView!

    var model: RecipeModel? {
        didSet {
            guard let model = model else { return }
            configure(with: model)
        }
    }

    var openRecipeInfoAction : (() -> Void)?

    func configure(with model: RecipeModel) {
        titleLabel.text = model.title
        recipeImageView.sd_setImage(with: model.image)
    }
}
