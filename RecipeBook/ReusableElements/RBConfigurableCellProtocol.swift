//
//  RBConfigurableCellProtocol.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 25/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import Foundation

protocol RBConfigurableCell {
    func config(withItem item: Any)
}