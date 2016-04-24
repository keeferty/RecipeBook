//
//  RBRecipe.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import ObjectMapper

class RBRecipe: Mappable {
     var title : String = ""
     var desc : String = ""
     var images : [RBImage] = []
    var ingredients : [RBIngredient] = []
    
    
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
