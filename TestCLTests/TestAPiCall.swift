//
//  TestAPiCall.swift
//  TestCLTests
//
//  Created by Ranjan on 16/08/24.
//

import XCTest
@testable import TestCL

final class TestAPiCall: XCTestCase {
    
    func testViewModel_callAPI_responseNotEmpty() {
        let expectation = XCTestExpectation(
            description: "get list"
        )
        let vm = PhotoListViewModel(service: HTTPServices())
        vm.getPhotoslistResponse()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 10, execute: {
            expectation.fulfill()
            print(vm.photosHits)
            XCTAssertNotNil(vm.photosHits)
        })
        wait(
            for: [expectation],
            timeout: 10
        )
    }
    
}
