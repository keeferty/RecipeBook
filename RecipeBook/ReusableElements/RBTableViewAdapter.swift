//
//  RBTableViewAdapter.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 25/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import UIKit

class RBTableViewAdapter<T, Cell: UITableViewCell where Cell: RBConfigurableCell> : NSObject, UITableViewDataSource {
    
    private let cellIdentifier = String(Cell)
    var items : [T]? = nil
    
    override init() {
        super.init()
    }
    
    func updateDatasource(items : [T]) {
        self.items = items
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items?.count ?? 0
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let cell =  tableView.dequeueReusableCellWithIdentifier(cellIdentifier) as! Cell
        
        if let item = self.items?[indexPath.row] {
            cell.config(withItem: item)
        }
        return cell
    }
    

}
