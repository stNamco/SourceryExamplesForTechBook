// Generated using Sourcery 0.14.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

@testable import SourceryExamples
import XCTest

// MARK: ItemRepository

class MockItemRepositoryImpl: ItemRepository {
    weak var delegate: RepositoryDelegate?
    
    init() {}
    
    // MARK: Variable: name = items, typeName = [Repository], isComputed = false, isStatic = false, readAccess = internal, writeAccess = , isMutable = false, defaultValue = nil, annotations = [:], attributes = [:], isFinal = false, definedInTypeName = Optional(ItemRepository), actualDefinedInTypeName = Optional(ItemRepository)
    
    var items: [Repository] = [Repository].arbitrary.generate
    
    // MARK: Variable: name = delegate, typeName = RepositoryDelegate?, isComputed = false, isStatic = false, readAccess = internal, writeAccess = internal, isMutable = true, defaultValue = nil, annotations = [:], attributes = [:], isFinal = false, definedInTypeName = Optional(ItemRepository), actualDefinedInTypeName = Optional(ItemRepository)
    
    func read(completion: (Result<[Repository]>) -> Void) {
        completion(.success(items))
    }
}

// MARK: DetailView

class MockDetailView: DetailView {
}

// MARK: MainView

class MockMainView: MainView {
    func presentAlert(error: Error) {
        XCTAssertTrue(true)
    }
    
    func updateItems() {
        XCTAssertTrue(true)
    }
}
