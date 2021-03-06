//
//  RecipeTableViewCell.swift
//  ViewControllers_demo_table_view
//
//  Created by Andrew Solovey on 15.07.2018.
//  Copyright © 2018 Andrew Solovey. All rights reserved.
//

import UIKit

class RecipeTableViewCell: UITableViewCell {
    @IBOutlet weak var iconImageView: UIImageView!
    @IBOutlet weak var recipeTitleLabel: UILabel!
    @IBOutlet weak var recipeIngredientsLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        recipeIngredientsLabel.textColor = UIColor.lightGray
    }
}
