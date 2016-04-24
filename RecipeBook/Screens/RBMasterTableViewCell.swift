//
//  MasterTableViewCell.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import UIKit

class RBMasterTableViewCell: UITableViewCell {

    @IBOutlet private weak var recipeImage: UIImageView!
    @IBOutlet private weak var recipeName: UILabel!
    @IBOutlet private weak var recipeDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
