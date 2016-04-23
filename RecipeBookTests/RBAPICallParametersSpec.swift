//
//  RBAPICallParametersTests.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 23/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//

import Quick
import Nimble

class RBAPICallParametersSpec: QuickSpec {
    override func spec() {
        describe("RBAPICallParameters Unit Tests") {
            it("Should not be able to create an instance of RBAPICallParameters") {
                let obj = RBAPICallParametersSpec()
                expect(obj).to(equal(nil))
            }
            
        }
    }
}
