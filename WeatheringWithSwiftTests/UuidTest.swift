//
//  UuidTest.swift
//  WeatheringWithSwiftTests
//
//  Created by aldo.wahyudi on 14/09/22.
//

import XCTest

class UuidTest: XCTestCase {

    func testGenreateUuidSuccessfully() throws {
        // Given
        let uuid = UUID()
        
        // When
        let uuidString = uuid.uuidString
        
        // Then
        // Example: 50BD3BF6-726F-47B2-BA64-D81276EE7E4F
        XCTAssertNotNil(uuidString)
        XCTAssertFalse(uuidString.isEmpty)
    }

}
