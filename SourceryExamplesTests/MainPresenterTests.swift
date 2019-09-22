//
//  MainPresenter.swift
//  SourceryExamplesTests
//
//  Created by stnamco on 2019/09/22.
//  Copyright © 2019 namco. All rights reserved.
//

@testable import SourceryExamples
import XCTest

class MainPresenterTests: XCTestCase {
    let view = MockMainView()
    var presenter: MainPresenter?
    
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        print("aaaa")
        presenter = MainPresenter(view: view, dependency: .init(repository: MockItemRepositoryImpl()))
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testReload() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        presenter?.reload()
        XCTAssert((presenter?.items.count ?? 0) > 0)
    }
}
