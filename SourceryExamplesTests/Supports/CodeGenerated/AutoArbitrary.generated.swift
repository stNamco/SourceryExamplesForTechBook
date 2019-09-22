// Generated using Sourcery 0.14.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

@testable import SourceryExamples
import SwiftCheck
import XCTest

// MARK: - AutoArbitrary for structs

// type

// MARK: - Person AutoArbitrary

extension Person: Arbitrary {
    public static var arbitrary: Gen<Person> {
        return Gen<Person>.compose { _ in
            Person(
                familyName: String.arbitrary.suchThat { $0.characters.count > 0 }.generate,
                firstName: String.arbitrary.suchThat { $0.characters.count > 0 }.generate,
                age: Int.arbitrary.suchThat { $0 >= 0 }.generate
            )
        }
    }
}

// type

// MARK: - Point AutoArbitrary

extension Point: Arbitrary {
    public static var arbitrary: Gen<Point> {
        return Gen<Point>.compose { _ in
            Point(
                x: Int.arbitrary.generate,
                y: Int.arbitrary.generate
            )
        }
    }
}

// type

// MARK: - Repository AutoArbitrary

extension Repository: Arbitrary {
    public static var arbitrary: Gen<Repository> {
        return Gen<Repository>.compose { _ in
            Repository(
                id: Int64.arbitrary.generate,
                name: String.arbitrary.generate,
                description: String.arbitrary.generate,
                isStarred: Bool.arbitrary.generate
            )
        }
    }
}

// MARK: - AutoArbitrary for enums
