//
//  TicModel.swift
//  TicTacToeApp
//
//  Created by Othman Djuliarso on 5/17/23.
//

import Foundation

// model

enum Cell: String {
    case x = "X"
    case o = "O"
    case b = "" // blank
}

struct TicModel {
    private var _grid: [Cell]
    
    init() {
        _grid = []
        for _ in 0..<9 {
            _grid.append(Cell.b)
        }
    }
    
    var grid: [Cell] {
        get { _grid }
    }
}
