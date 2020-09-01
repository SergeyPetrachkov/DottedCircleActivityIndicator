import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(DottedCircleActivityIndicatorTests.allTests),
    ]
}
#endif
