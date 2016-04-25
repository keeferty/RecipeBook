//
//  RBMasterViewModel.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class RBMasterViewModel {
    
    let disposeBag = DisposeBag()
    
    var rx_onError : PublishSubject<NSError> = PublishSubject()
    var rx_dataSourceUpdate : PublishSubject<String> = PublishSubject()
    var adapter = RBTableViewAdapter<RBRecipe,RBMasterTableViewCell>()

    
    func activate()  {
        setupFetchData()
    }
}

extension RBMasterViewModel {
    
    func setupFetchData()  {
        RBAPIService<RBRecipe>.rx_requestAPIFor(.RecipeList, size: .ThumbnailMedium, ratio: 1, limit: 50, from: 0)
            .subscribeNext { (items: [RBRecipe]) in
                self.adapter.updateDatasource(items)
                self.rx_dataSourceUpdate.onNext("")
            }
            .addDisposableTo(disposeBag)
    }
}