//
//  RBIngredientElement.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import ObjectMapper
import RealmSwift
import RealmMapper

class RBIngredientElement: Object, Mappable {
    dynamic var name : String = ""
    dynamic var amount : Int = 0
    
    
    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        name <- map["name"]
        amount <- map["amount"]
    }
}

