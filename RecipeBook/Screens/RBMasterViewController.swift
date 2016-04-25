//
//  RBMasterViewController.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa


class RBMasterViewController: RBBaseViewController {

    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel: RBMasterViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupViewModel()
        self.setupTableView()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "showDetail" {
            if let indexPath = self.tableView.indexPathForSelectedRow {
                let vm = self.viewModel.detailViewModelAtIndex(indexPath.row)
                let controller = (segue.destinationViewController as! UINavigationController).topViewController as! RBDetailViewController
                controller.viewModel = vm
                controller.navigationItem.leftBarButtonItem = self.splitViewController?.displayModeButtonItem()
                controller.navigationItem.leftItemsSupplementBackButton = true
            }
        }
    }
}

extension RBMasterViewController {
    
    func setupViewModel() {
        viewModel = RBMasterViewModel()
        viewModel.activate()
        //show alert on error with a retry
        viewModel
            .rx_onError
            .asObservable()
            .observeOn(MainScheduler.instance)
            .subscribeOn(MainScheduler.instance)
            .subscribeNext { [unowned self] (error) -> Void in
                let alert = UIAlertController(title: error.localizedDescription, message: nil, preferredStyle: UIAlertControllerStyle.ActionSheet)
                let action = UIAlertAction(title: "OK", style: UIAlertActionStyle.Default, handler: { action in
                    self.setupViewModel()
                    alert.dismissViewControllerAnimated(true, completion: nil)
                })
                alert.addAction(action)
                self.presentViewController(alert, animated: true, completion: nil)
            }
            .addDisposableTo(disposeBag)
        //connect datasource adapter and updates
        self.tableView.dataSource = viewModel.adapter
        viewModel
            .rx_dataSourceUpdate
            .subscribeOn(MainScheduler.instance)
            .subscribe { [unowned self] event in
                if let _ = event.element {
                    self.tableView.reloadData()
                }
            }
            .addDisposableTo(disposeBag)
    }
    
    func setupTableView()  {
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 160.0
        tableView
            .rx_itemSelected
            .subscribeOn(MainScheduler.instance)
            .subscribeNext { [weak self](indexPath) in
                self?.performSegueWithIdentifier("showDetail", sender: self)
            }
            .addDisposableTo(disposeBag)
    }
}