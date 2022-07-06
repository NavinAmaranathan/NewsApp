//
//  StringExtensionTests.swift
//  NewsAppTests
//
//  Created by Navi on 06/07/22.
//

import XCTest
@testable import NewsApp

class StringExtensionTests: XCTestCase {

    func test_Date_Formatter_Success() {
        let publishedDate =  "2022-04-21T11:37:19Z"
        XCTAssertEqual(publishedDate.formatToDate, Values.expectedDate)
    }
    
    func test_Date_Formatter_Failure() {
        let publishedDate =  "2022-04-21T11:"
        XCTAssertNotEqual(publishedDate.formatToDate, Values.expectedDate)
    }
}

extension StringExtensionTests {
    enum Values {
        static let expectedDate: String = "Apr 21, 2022"
    }
}
