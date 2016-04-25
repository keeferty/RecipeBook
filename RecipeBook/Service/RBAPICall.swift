//
//  RBAPICall.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import Alamofire

enum RBAPICall: URLRequestConvertible {
    static let BASE_URL = "http://www.godt.no/api/"
    
    case GetList(param: RBAPICallParameters?)
    
    var method : Alamofire.Method {
        switch self {
        case .GetList:
            return .GET
        }
    }

    var endpoint : String {
        switch self {
        case .GetList:
            return "getRecipesListDetailed"
        }
    }
    
    var URLRequest: NSMutableURLRequest {
        let URL = NSURL(string: RBAPICall.BASE_URL)!
        let URLRequest = NSMutableURLRequest(URL: URL.URLByAppendingPathComponent(endpoint))
        URLRequest.HTTPMethod = method.rawValue
        
        switch self {
        case .GetList(let parameters):
            return Alamofire.ParameterEncoding.URL.encode(URLRequest, parameters: parameters == nil ? nil : parameters!.params).0
        }
    }
}
