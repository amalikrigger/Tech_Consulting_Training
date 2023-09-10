//
//  RBSNewsTests.swift
//  RBSNewsTests
//
//  RBS Tests Project on 12/10/20.
//

import XCTest
@testable import RBSNews

class RBSNewsTests: XCTestCase {
    
    var newsViewModel:NewsViewModel!
    
    override func setUpWithError() throws {
        super.setUp()
        newsViewModel = NewsViewModel()
    }

    override func tearDownWithError() throws {
        super.tearDown()
        newsViewModel = nil
    }

    func testNewsModelTotalResults() {
        newsViewModel.parseJSON { (result) in
            switch result {
            case .success(let news):
                XCTAssertEqual(news?.totalResults, 70, "Total results is not matching!")
                XCTAssertNotEqual(news?.totalResults, 69, "Total results are matching!")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func testNewsModelArticles() {
        newsViewModel.parseJSON { (result) in
            switch result {
            case .success(let news):
                XCTAssertEqual(news?.articles?.count, 6, "Articles count is not matching!")
                XCTAssertNotEqual(news?.articles?.count, 20, "Articles count is matching!")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }

}
