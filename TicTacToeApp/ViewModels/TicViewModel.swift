//
//  TicViewModel.swift
//  TicTacToeApp
//
//  Created by Othman Djuliarso on 5/18/23.
//

import Foundation

class TicViewModel: ObservableObject {
    @Published private var ticModel: TicModel
    
    init() {
        ticModel = TicModel()
    }
    
    var grid: [Cell] {
        get { ticModel.grid }
    }
    
}
