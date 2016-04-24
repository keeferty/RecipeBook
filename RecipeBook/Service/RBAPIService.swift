//
//  RBAPIService.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import Alamofire
import RxSwift
import RxCocoa

enum AvailableCalls {
    case RecipeList
}

final class RBAPIService {
    
    private init(){}
    
    static func rx_requestAPIFor(what: AvailableCalls, size: ThumbnailSize, ratio: Int?, limit: Int?, from: Int?) -> Observable<AnyObject> {
        
        let parameters = RBAPICallParameters.Builder()
                            .size(size)
                            .ratio(ratio)
                            .limit(limit)
                            .from(from)
                            .build()
        
        return rx_requestAPIFor(what, parameters: parameters)
    }
    
    
    static func rx_requestAPIFor(what: AvailableCalls, parameters: RBAPICallParameters) -> Observable<AnyObject> {
        
        return Observable.create { subscriber -> Disposable in
            
            let request = self.requestFor(what, parameters: parameters)
                .responseString(completionHandler: { response in
                    if let _ = response.result.value {
                        //print(result)
                    } else {
                        subscriber.onError(NSError(domain: "There is no results", code: 1000, userInfo: nil))
                    }
                })
            .responseJSON(completionHandler: { (response : Response<AnyObject, NSError>) -> Void in
                switch response.result {
                case .Success(let value):
                    subscriber.onCompleted()
                case .Failure(let error):
                    subscriber.onError(error)
                }
            })            
            return AnonymousDisposable {
                request.cancel()
            }
        }
    }
    
    //MARK: Helper Methods
    static func requestFor(what: AvailableCalls, parameters: RBAPICallParameters) -> Request {
        let call : RBAPICall
        switch what {
        case .RecipeList:
            call = RBAPICall.GetList(param: parameters)
        }
        
        let request = Alamofire.request(call)
        return request
    }
}
