//
//  MasterTableViewCell.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import UIKit
import AlamofireImage

class RBMasterTableViewCell: UITableViewCell, RBConfigurableCell {

    @IBOutlet private weak var recipeImage: UIImageView!
    @IBOutlet private weak var recipeName: UILabel!
    @IBOutlet private weak var recipeDescription: UILabel!
    
    func config(withItem item: Any) {
        guard let castedItem = item as? RBRecipe
            else {
                return
        }
        recipeName.text = castedItem.title
        recipeDescription.text = castedItem.desc
        if castedItem.images.count > 0 {
            let image = castedItem.images.first!
            recipeImage.af_setImageWithURL(NSURL(string: image.url)!,
                                           placeholderImage: UIImage(named: "placeholder"),
                                           filter: nil,
                                           progress: nil,
                                           progressQueue: dispatch_get_main_queue(),
                                           imageTransition: .CrossDissolve(0.3),
                                           runImageTransitionIfCached: true,
                                           completion: nil)
        }
    }
    
    override func prepareForReuse() {
        recipeImage.af_cancelImageRequest()
    }
}
