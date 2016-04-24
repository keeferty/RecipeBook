//
//  RBImage.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import ObjectMapper

class RBImage: Mappable {
     var id : String = ""
     var url : String = ""

    required convenience init?(_ map: Map) {
        self.init()
    }
    
    func mapping(map: Map) {
        id <- map["imboId"]
        url <- map["url"]
    }

}
