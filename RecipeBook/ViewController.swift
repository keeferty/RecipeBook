//
//  ViewController.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 23/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import UIKit
import RxSwift


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        RBAPIService.rx_requestAPIFor(.RecipeList, size: .ThumbnailMedium, ratio: Optional(1), limit: Optional(50), from: Optional(0))
            .subscribeCompleted { 
                print("dupa")
        }        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

