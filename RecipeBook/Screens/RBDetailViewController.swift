//
//  RBDetailViewController.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import UIKit
import RxSwift
import RxCocoa
import AlamofireImage

class RBDetailViewController: RBBaseViewController {
    
    @IBOutlet private weak var tableHeader: RBDetailTableHeader!
    @IBOutlet private weak var tableView: UITableView!
    
    var viewModel : RBDetailViewModel?{
        didSet {
            self.viewModel!.activate()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.refreshView(self.viewModel!.dataToDisplay())
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // Dynamic sizing for the header view
            let height = tableHeader.systemLayoutSizeFittingSize(UILayoutFittingCompressedSize).height
            var headerFrame = tableHeader.frame
            
            if height != headerFrame.size.height {
                headerFrame.size.height = height
                tableHeader.frame = headerFrame
                tableView.tableHeaderView = tableHeader
            }
    }
}

extension RBDetailViewController {
    func refreshView(data:(name: String, description: String, url: NSURL?)) {
        tableView.dataSource = viewModel?.adapter
        tableView.reloadData()
        tableHeader.recipeTitle.text = data.name
        tableHeader.recipeDescription.text = data.description
        if let url = data.url {
            tableHeader.recipeImage.af_setImageWithURL(url,
                                           placeholderImage: UIImage(named: "placeholder"),
                                           filter: nil,
                                           progress: nil,
                                           progressQueue: dispatch_get_main_queue(),
                                           imageTransition: .CrossDissolve(0.3),
                                           runImageTransitionIfCached: true,
                                           completion: nil)

        }
    }
}