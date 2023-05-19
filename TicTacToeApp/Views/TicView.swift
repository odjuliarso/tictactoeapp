//
//  TicView.swift
//  TicTacToeApp
//
//  Created by Othman Djuliarso on 5/18/23.
//

import SwiftUI

struct TicView: View {
    @ObservedObject private var ticVm: TicViewModel
    
    init() {
        ticVm = TicViewModel()
    }
    
    var body: some View {
        VStack {
            Text("Tic Tac Toe Game")
            
            VStack(spacing: 3) {
                let n = 3
                ForEach(0..<n, id:\.self) { r in
                    HStack(spacing: 3) {
                        ForEach(0..<n, id:\.self) { c in
                            let index = (r*n) + c
                            HStack {
                                Text("\(index)")
                                Text("\(ticVm.grid[index].rawValue)")
                                    .foregroundColor(.red)
                            }
                            .frame(width: 80, height: 80)
                        }
                    }
                }
            }
            Spacer()
        }
    }
}

struct TicView_Previews: PreviewProvider {
    static var previews: some View {
        TicView()
    }
}
