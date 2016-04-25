//
//  RBDataCenter.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 25/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa
import RealmSwift

enum RealmError: ErrorType {
    case WrongThread
    case InvalidRealm
    case InvalidReadThread
}

class RBDataCenter {
    static let instance = RBDataCenter()
    
    let disposeBag = DisposeBag()
    var operationQueue : NSOperationQueue!
    var backgroundWorkScheduler : OperationQueueScheduler!
    
    private init(){
        setupBackgroundWorkScheduler()
    }
}

extension RBDataCenter {
    func setupBackgroundWorkScheduler() {
        operationQueue = NSOperationQueue()
        operationQueue.maxConcurrentOperationCount = 3
        operationQueue.qualityOfService = NSQualityOfService.UserInitiated
        backgroundWorkScheduler = OperationQueueScheduler(operationQueue: operationQueue)
    }
    
    func getData() -> Observable<[RBRecipe]> {
        let realm = try! Realm()
        if realm.isEmpty {
            let params = RBAPICallParameters.Builder()
                .size(.ThumbnailMedium)
                .ratio(1)
                .limit(50)
                .from(0)
                .build()
            return rx_requestAPI(.RecipeList, parameter: params)
        }else {
            return Realm.rx_objects(RBRecipe).map{Array($0)}
                    .subscribeOn(MainScheduler.instance)
        }
    }
    
    func rx_requestAPI(what: AvailableCalls, parameter : RBAPICallParameters) -> Observable<[RBRecipe]> {
        return RBAPIService<RBRecipe>.rx_requestAPIFor(what, parameters: parameter)
            .subscribeOn(backgroundWorkScheduler)
            .doOn(
                onNext: { recipeList in
                    let realm = try! Realm()
                    try realm.write({
                        for recipe in recipeList {
                            realm.add(recipe)
                        }
                    })
                },
                onError: nil,
                onCompleted: nil)
            .asObservable()
    }
    
    func rx_objects<T: Object>(type: T.Type) -> Observable<RealmSwift.Results<T>> {
        return Observable.create { observer in
            if !NSThread.isMainThread() {
                observer.onError(RealmError.InvalidReadThread)
            }
            else {
                do {
                    let realm = try Realm()
                    observer.onNext(realm.objects(type))
                    observer.onCompleted()
                }
                catch  {
                    observer.onError(RealmError.InvalidRealm)
                }
            }
            return NopDisposable.instance
        }
    }
}