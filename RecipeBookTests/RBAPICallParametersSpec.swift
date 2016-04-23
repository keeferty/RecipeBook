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
            let builder = RBAPICallParameters.Builder()

            it("RBAPICallParameters.params should not me nil") {
                let params = builder.build().params
                expect(params).notTo(beNil())
            }
            it("Builder should be accessible") {
                expect(builder).notTo(beNil())
            }
            
            describe("Size field tests") {
                it("nil size should not be in the params") {
                    let params = builder.size(nil).build()
                    expect(params.params.keys.contains("size")).toNot(beTrue())
                }
                it("set size should be in the params") {
                    let params = builder.size(.ThumbnailMedium).build()
                    expect(params.params.keys.contains("size")).to(beTrue())
                    let value = params.params["size"] as? String
                    expect(value).toNot(beNil())
                    expect(value == "thumbnail-medium").to(beTrue())
                }
                it("reset size should change in the params") {
                    let params = builder.size(nil).build()
                    expect(params.params.keys.contains("size")).to(beFalse())
                    let value = params.params["size"] as? String
                    expect(value).to(beNil())
                }
            }
            
            describe("Ratio field tests") {
                it("nil ratio should not be in the params") {
                    let params = builder.ratio(nil).build()
                    expect(params.params.keys.contains("ratio")).toNot(beTrue())
                }
                it("set ratio should be in the params") {
                    let params = builder.ratio(1).build()
                    expect(params.params.keys.contains("ratio")).to(beTrue())
                    let value = params.params["ratio"] as? Int
                    expect(value).toNot(beNil())
                    expect(value == 1).to(beTrue())
                }
                it("reset ratio should change in the params") {
                    var params = builder.ratio(1).build()
                    params = builder.ratio(2).build()
                    expect(params.params.keys.contains("ratio")).to(beTrue())
                    let value = params.params["ratio"] as? Int
                    expect(value).toNot(beNil())
                    expect(value == 2).to(beTrue())
                }
            }
            
            describe("Limit field tests") {
                it("nil limit should not be in the params") {
                    let params = builder.limit(nil).build()
                    expect(params.params.keys.contains("limit")).toNot(beTrue())
                }
                it("set limit should be in the params") {
                    let params = builder.limit(1).build()
                    expect(params.params.keys.contains("limit")).to(beTrue())
                    let value = params.params["limit"] as? Int
                    expect(value).toNot(beNil())
                    expect(value == 1).to(beTrue())
                }
                it("reset limit should change in the params") {
                    var params = builder.limit(1).build()
                    params = builder.limit(2).build()
                    expect(params.params.keys.contains("limit")).to(beTrue())
                    let value = params.params["limit"] as? Int
                    expect(value).toNot(beNil())
                    expect(value == 2).to(beTrue())
                }
            }
            
            describe("From field tests") {
                it("nil from should not be in the params") {
                    let params = builder.from(nil).build()
                    expect(params.params.keys.contains("from")).toNot(beTrue())
                }
                it("set from should be in the params") {
                    let params = builder.from(1).build()
                    expect(params.params.keys.contains("from")).to(beTrue())
                    let value = params.params["from"] as? Int
                    expect(value).toNot(beNil())
                    expect(value == 1).to(beTrue())
                }
                it("reset from should change in the params") {
                    var params = builder.from(1).build()
                    params = builder.from(2).build()
                    expect(params.params.keys.contains("from")).to(beTrue())
                    let value = params.params["from"] as? Int
                    expect(value).toNot(beNil())
                    expect(value == 2).to(beTrue())
                }
            }
        }
    }
}
