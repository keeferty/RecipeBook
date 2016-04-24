//
//  RBAPICallSpec.swift
//  RecipeBook
//
//  Created by Pawel Weglewski on 24/04/16.
//  Copyright © 2016 Schibsted. All rights reserved.
//


import Quick
import Nimble
import Alamofire

class RBAPICallSpec: QuickSpec {
    override func spec() {
        describe("RBAPICall Unit Tests") {
            it("RBAPICall produces not nil objects") {
                let call = RBAPICall.GetList(param: nil)
                expect(call).toNot(beNil())
            }
            it("RBAPICall produces correct calls for set Base url") {
                let call = RBAPICall.GetList(param: nil)
                let request = Alamofire.request(call)
                expect(request).toNot(beNil())
                expect(request.request!.URLString == RBAPICall.BASE_URL).to(beTrue())
            }
        }
    }
}
