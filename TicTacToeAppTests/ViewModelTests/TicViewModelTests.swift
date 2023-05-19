//
//  TicViewModelTests.swift
//  TicTacToeAppTests
//
//  Created by Othman Djuliarso on 5/18/23.
//

import XCTest
@testable import TicTacToeApp

class TicViewModelTests: XCTestCase {

    func test_initialValue_nineCells() {
        // Arrange
        let ticViewModel = TicViewModel()
        
        // Act
         
        // Assert
        XCTAssertEqual(ticViewModel.grid.count, 9)
    }
    
    func test_initialValue_IsBlank() {
        // Arrange
        let ticViewModel = TicViewModel()
        
        // Act
        
        // Assert
        XCTAssertEqual((ticViewModel.grid.filter { $0 == Cell.b }.count), 9)
    }

    func test_initialValue_noWinner() {
        
        // given
        let ticViewModel = TicViewModel()

        // when

        // then
        XCTAssertEqual(Winner.none, ticViewModel.winner)
    }
    
    
}
