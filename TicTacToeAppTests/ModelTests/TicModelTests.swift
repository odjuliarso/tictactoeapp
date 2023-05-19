//
//  TicTacToeAppTests.swift
//  TicTacToeAppTests
//
//  Created by Othman Djuliarso on 5/16/23.
//

import XCTest
@testable import TicTacToeApp

class TicModelTests: XCTestCase {
    
    // The first unit test is to verify initial grid is 9 cells
    func test_initialValue_NineCells() {
        
        // Arrange
        let ticModel = TicModel()
        
        // Act
        
        // Assert
        XCTAssertEqual(ticModel.grid.count, 9)
    }
    
    //initial unit test verify initial grid is blank
    func test_initialValue_IsBlank() {
        // Arrange
        let ticModel = TicModel()
            
        // Act
        
        // Assert
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 9)
    }
}

