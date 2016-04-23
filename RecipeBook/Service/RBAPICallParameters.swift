//
//  RBAPICallParameters.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 23/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

enum ThumbnailSize : String {
    case ThumbnailMedium = "thumbnail-medium"
}

enum AvailableParams : String {
    case Size   = "size"
    case Ratio  = "ratio"
    case Limit  = "limit"
    case From   = "from"
}

final class RBAPICallParameters {
    private init(){}
    var params : [String : AnyObject] = [:]
    
    private func add(field: AvailableParams, value: AnyObject) {
        params[field.rawValue] = value
    }
    
    private func remove(field: AvailableParams) {
        if params.keys.contains(field.rawValue) {
            params.removeValueForKey(field.rawValue)
        }
    }
    
    class Builder {
        private var parameters : RBAPICallParameters!
        private var size : ThumbnailSize?
        private var ratio : Int?
        private var limit : Int?
        private var from : Int?
        
        
        init() {
            parameters = RBAPICallParameters()
        }
        
        func size(s: ThumbnailSize?) -> Builder {
            if s == nil {
                parameters.remove(.Size)
            }
            size = s
            return self
        }
        
        func ratio(r: Int?) -> Builder {
            if r == nil {
                parameters.remove(.Ratio)
            }
            ratio = r
            return self
        }
        
        func limit(lim: Int?) -> Builder {
            if lim == nil {
                parameters.remove(.Limit)
            }
            limit = lim
            return self
        }
        
        func from(f: Int?) -> Builder {
            if f == nil {
                parameters.remove(.From)
            }
            from = f
            return self
        }
        
        func build() -> RBAPICallParameters {
            
            if let s = size {
                parameters.add(.Size, value: s.rawValue)
            }
            if let r = ratio {
                parameters.add(.Ratio, value: r)
            }
            if let lim = limit {
                parameters.add(.Limit, value: lim)
            }
            if let f = from {
                parameters.add(.From, value: f)
            }
            
            return parameters
        }
        
    }

}