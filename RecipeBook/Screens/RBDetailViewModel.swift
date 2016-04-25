//
//  RBDetailViewModel.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RBDetailViewModel {

    var recipe : RBRecipe
    
    var adapter = RBTableViewAdapter<RBIngredientElement,RBDetailTableViewCell>()

    init(recipe: RBRecipe) {
        self.recipe = recipe
    }
    
    func activate() {
        let ingredients = recipe.ingredients.map { return $0.elements}.reduce([], combine: +)
        adapter.updateDatasource(ingredients)
    }
    
    func dataToDisplay() -> (name: String, description: String,url: NSURL?) {
        if recipe.images.count > 0, let image = recipe.images.first {
            return (recipe.title, recipe.desc, NSURL(string: image.url)!)
        }
        return (recipe.title, recipe.desc, nil)
    }
    
}
