//
//  TicModel.swift
//  TicTacToeApp
//
//  Created by Othman Djuliarso on 5/17/23.
//

import Foundation

enum Cell: String {
    case x = "X"
    case o = "O"
    case b = "" // blank
}

enum Winner {
    case o, x, none
}

struct TicModel {
    private var _grid: [Cell]
    private var _winner: Winner
    
    init() {
        _grid = []
        for _ in 0..<9 {
            _grid.append(Cell.b)
        }
        _winner = .none
    }
    
    var grid: [Cell] {
        get { _grid }
    }
    
    var winner: Winner {
        get { _winner }
    }
    
    mutating func setCell(n: Int, c: Cell) {
        guard _grid.indices.contains(n) else {
            return
        }
        guard _grid[n] == .b else {
            return
        }
        _grid[n] = c
    }
    
}
