//
//  SwiftCheckExamplesTests.swift
//  SourceryExamplesTests
//
//  Created by stnamco on 2019/09/07.
//  Copyright © 2019 namco. All rights reserved.
//

@testable import SourceryExamples
import SwiftCheck
import XCTest

class PersonTests: XCTestCase {
    func testPersonName() {
        property("familyName and firstName should be difference") <- forAll { (p: Person) in
            p.familyName != p.firstName
        }
    }
}
