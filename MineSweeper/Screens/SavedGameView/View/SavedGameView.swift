//
//  GameView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import SwiftUI

struct SavedGameView: View {
    
    @StateObject var vm: SavedGameViewModel
    var body: some View {
        ZStack {
            VStack {
                Text(vm.selectedField)
                
                if vm.game.gameStatus == .lose {
                    Text("You lose :(")
                        .bold()
                        .foregroundStyle(.red)
                } else if vm.game.gameStatus == .win {
                    Text("You win :)")
                        .bold()
                        .foregroundStyle(.green)
                } else {
                    Text("======")
                        .bold()
                        .foregroundStyle(.white)
                }
                
                GridView(rows: vm.rows, columns: vm.columns) { row, col in
                    GameCellView(isActive: $vm.field[row][col].clicked, value: $vm.field[row][col].value, isMarked: $vm.field[row][col].marked){
                        vm.click(row: row, column: col)
                    } markAction: {
                        vm.marked(row: row, column: col)
                        
                    }
                    .disabled(vm.field[row][col].clicked || vm.field[row][col].marked)
                }
                .disabled((vm.game.gameStatus == .game || vm.game.gameStatus == .start) ? false : true)
            }
        }
    }
}

//#Preview {
//    GameView()
//}
