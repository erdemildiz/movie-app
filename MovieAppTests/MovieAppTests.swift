//
//  MovieAppTests.swift
//  MovieAppTests
//
//  Created by Erdem ILDIZ on 25.02.2021.
//

import XCTest
@testable import MovieApp

class MovieAppTests: XCTestCase {


    func testNetworkManager() {
        let networkServiceExpectation = expectation(description: "Network satatus is waiting")
        NetworkStatusManager.manager.checkNetwork { (status) in
            XCTAssertTrue(status == .isOn, "Network error!")
            networkServiceExpectation.fulfill()
        }
        waitForExpectations(timeout: 1) { (error) in
            if let error = error {
                XCTFail("Network expectation error: \(error.localizedDescription)")
            }
        }
    }
    
    func testMovieServiceBaseUrl() {
        let movieServiceUrl = AppUrls.MovieService.baseUrl.value
        XCTAssertEqual(movieServiceUrl, "http://www.omdbapi.com/")
    }


}
