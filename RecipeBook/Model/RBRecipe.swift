//
//  RBRecipe.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import ObjectMapper
import RealmSwift
import RealmMapper

class RBRecipe: Object, Mappable {
    dynamic var title : String = ""
    dynamic var desc : String = ""
    let images = List<RBImage>()
    let ingredients = List<RBIngredient>()
    
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        title <- map["title"]
        desc <- map["description"]
        images <- map["images"]
        ingredients <- map["ingredients"]
    }
}
