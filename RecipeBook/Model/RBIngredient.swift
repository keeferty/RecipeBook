//
//  RBIngredient.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import ObjectMapper
import RealmSwift
import RealmMapper

class RBIngredient: Object, Mappable {
    dynamic var name : String = ""
    let elements = List<RBIngredientElement>()
    
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        elements <- map["elements"]
    }
    
}
