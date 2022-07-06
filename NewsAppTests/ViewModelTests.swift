//
//  ViewModelTests.swift
//  NewsAppTests
//
//  Created by Navi on 06/07/22.
//

import XCTest
@testable import NewsApp

class ViewModelTests: XCTestCase {

    private var viewModel: ViewModelData?
    
    override func setUpWithError() throws {
        viewModel = ViewModel()
        viewModel?.delegate = self
    }

    override func tearDownWithError() throws {
        viewModel = nil
    }
    
    func test_API_Fetch() {
        viewModel?.fetchArticles()
    }
}

extension ViewModelTests {
    enum Values {
        static let articleCount: Int = 64
    }
}

extension ViewModelTests: ViewModelDelegate {
    func didFetchArticles(articles: [Article]?) {
        XCTAssertNotNil(articles?.count)
    }
    
    func didFail(with error: Error) {
        XCTFail(error.localizedDescription)
    }
}
