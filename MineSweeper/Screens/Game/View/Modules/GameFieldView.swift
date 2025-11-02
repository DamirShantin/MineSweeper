//
//  GameView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation
import SwiftUI

struct GameFieldView: View {
    
    @StateObject var vm: GameViewModel
    
    var body: some View {
        ZStack {
            VStack {
                GridView(rows: vm.rows, columns: vm.columns) { row, col in
                    GameCellView(isActive: $vm.field[row][col].clicked, value: $vm.field[row][col].value, isMarked: $vm.field[row][col].marked){
                        vm.click(row: row, column: col)
                        
                    } markAction: {
                        vm.marked(row: row, column: col)
                        
                    }
//                    .disabled(vm.field[row][col].clicked || vm.field[row][col].marked)
                }
                .disabled((vm.game.gameStatus == .game || vm.game.gameStatus == .start) ? false : true)
            }
        }
    }
}
