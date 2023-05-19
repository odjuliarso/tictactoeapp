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
    
    func test_setCell3_IsX() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        ticModel.setCell(n: 3, c: .x)
        
        // Assert
        XCTAssertTrue(ticModel.grid[3] == Cell.x)
    }
    
    // test to verify setting a value to a cell outside of grid
    func test_setCell42_IsIgnored() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        ticModel.setCell(n: 42, c: .x)
        
        // Assert
        XCTAssertTrue(ticModel.grid.contains { $0 == Cell.b } )
    }
    
    // test to verify a cell can only be set once
    func test_setCellTwice_ignoreSecond() {
        // Arrange
        var ticModel = TicModel()
        
        // act
        ticModel.setCell(n: 3, c: .x)
        ticModel.setCell(n: 3, c: .o)
        
        // assert
        XCTAssertTrue(ticModel.grid[3] == Cell.x)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.x }.count), 1)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count), 8)
    }
    
    func test_setCellBlank_ignored() {
        // arrange
        var ticModel = TicModel()
        
        // act
        ticModel.setCell(n: 3, c: .x)
        ticModel.setCell(n: 3, c: .b)
        
        // assert
        XCTAssertTrue(ticModel.grid[3] == Cell.x)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.x }.count) , 1)
        XCTAssertEqual((ticModel.grid.filter { $0 == Cell.b }.count) , 8)
    }
    
    func test_initialGame_isNotWon() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        let result = ticModel.updateGameStatus()
        
        // Assert
        XCTAssertFalse(result)
    }
    
    func test_topLineX_xIsWinner() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        for i in [0,1,2] {
            ticModel.setCell(n: i, c: .x)
        }
        let result = ticModel.updateGameStatus()
        
        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.x, ticModel.winner)
    }
    
    func test_middleLineX_xIsWinner() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        for i in [3,4,5] {
            ticModel.setCell(n: i, c: .x)
        }
        let result = ticModel.updateGameStatus()
        
        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.x, ticModel.winner)
    }
    
    func test_bottomLineX_xIsWinner() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        for i in [6,7,8] {
            ticModel.setCell(n: i, c: .x)
        }
        let result = ticModel.updateGameStatus()
        
        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.x, ticModel.winner)
    }
    
    func test_leftLineO_oIsWinner() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        for i in [0,3,6] {
            ticModel.setCell(n: i, c: .o)
        }
        let result = ticModel.updateGameStatus()
        
        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.o, ticModel.winner)
    }
    
    func test_middleLineO_oIsWinner() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        for i in [1,4,7] {
            ticModel.setCell(n: i, c: .o)
        }
        let result = ticModel.updateGameStatus()
        
        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.o, ticModel.winner)
    }
    
    func test_rightLineO_oIsWinner() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        for i in [2,5,8] {
            ticModel.setCell(n: i, c: .o)
        }
        let result = ticModel.updateGameStatus()
        
        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.o, ticModel.winner)
    }
    
    func test_diagonalO_oIsWinner() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        for i in [0,4,8] {
            ticModel.setCell(n: i, c: .o)
        }
        let result = ticModel.updateGameStatus()
        
        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.o, ticModel.winner)
    }
    
    func test_diagonalX_xIsWinner() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        for i in [2,4,6] {
            ticModel.setCell(n: i, c: .x)
        }
        let result = ticModel.updateGameStatus()
        
        // Assert
        XCTAssertTrue(result)
        XCTAssertEqual(Winner.x, ticModel.winner)
    }
    
    func test_isGridFullNewGame_false() {
        // Arrange
        let ticModel = TicModel()
        
        // Act
        
        // Assert
        XCTAssertFalse(ticModel.isGridFull)
    }
    
    func test_isGridFullPartialGame_false() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        for i in 0..<5 {
            ticModel.setCell(n: i, c: .x)
        }
        
        // Assert
        XCTAssertFalse(ticModel.isGridFull)
    }
    
    func test_isGridFullGameOver_true() {
        // Arrange
        var ticModel = TicModel()
        
        // Act
        for i in 0..<9 {
            ticModel.setCell(n: i, c: .o)
        }
        
        // Assert
        XCTAssertTrue(ticModel.isGridFull)
    }
    
}


