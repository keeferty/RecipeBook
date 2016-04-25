//
//  RBDetailTableHeader.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 25/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import UIKit

class RBDetailTableHeader: UIView {
    @IBOutlet weak var recipeImage: UIImageView!
    @IBOutlet weak var recipeTitle: UILabel!
    @IBOutlet weak var recipeDescription: UILabel!

    override func layoutSubviews() {
        super.layoutSubviews()
        self.recipeDescription.preferredMaxLayoutWidth = CGRectGetWidth(recipeDescription.frame);
    }
}
