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

class RBMasterViewModel : NSObject{
    
    let disposeBag = DisposeBag()
    
    var rx_onError : PublishSubject<NSError> = PublishSubject()
    var rx_dataSourceUpdate : PublishSubject<String> = PublishSubject()
    var rx_updateDetail : PublishSubject<RBDetailViewModel> = PublishSubject()
    
    var adapter = RBTableViewAdapter<RBRecipe,RBMasterTableViewCell>()
    var items : [RBRecipe]? = nil
    var filteredItems : [RBRecipe]? = nil
    
    func activate()  {
        setupFetchData()
    }
}

extension RBMasterViewModel {
    
    func setupFetchData()  {
        RBAPIService<RBRecipe>.rx_requestAPIFor(.RecipeList, size: .ThumbnailMedium, ratio: 1, limit: 50, from: 0)
            .subscribe({ [unowned self] event in
                if let error = event.error {
                    self.rx_onError.onNext(error as NSError)
                } else if let resultItems = event.element {
                    self.items = resultItems
                    self.adapter.updateDatasource(self.items!)
                    self.rx_dataSourceUpdate.onNext("")
                }
            })
            .addDisposableTo(disposeBag)
    }
    
    func detailViewModelAtIndex(index: Int) -> RBDetailViewModel {
        return RBDetailViewModel(recipe: adapter.items![index])
    }
}

extension RBMasterViewModel : UISearchResultsUpdating {
    func updateSearchResultsForSearchController(searchController: UISearchController) {
        if searchController.searchBar.text != nil && searchController.searchBar.text?.characters.count > 0 {
            filterItems(searchController.searchBar.text!)
            adapter.updateDatasource(filteredItems!)
        } else {
            adapter.updateDatasource(items!)
        }
        self.rx_dataSourceUpdate.onNext("")
    }
    
    func filterItems(query: String) {
        filteredItems = items?.filter({ (recipe: RBRecipe) -> Bool in
            let titleContains = recipe.title.localizedCaseInsensitiveContainsString(query)
            let numberOfIngredients = recipe.ingredients.map { return $0.elements}.reduce([], combine: +)
                                                        .filter({ (ingredient :RBIngredientElement) -> Bool in
                                                            return ingredient.name.localizedCaseInsensitiveContainsString(query)
                                                        })
            let ingredientsContain = numberOfIngredients.count > 0
            return titleContains || ingredientsContain
        })
    }
}