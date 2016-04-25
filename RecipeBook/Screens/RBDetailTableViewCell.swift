//
//  RBDetailTableViewCell.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 25/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import UIKit

class RBDetailTableViewCell: UITableViewCell, RBConfigurableCell {

    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var amountLabel: UILabel!
    
    func config(withItem item: Any) {
        guard let castedItem = item as? RBIngredientElement
            else {
                return
        }
        nameLabel.text = castedItem.name
        amountLabel.text = String(castedItem.amount)
    }
}
