//
//  GameView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation
import SwiftUI

struct GameView: View {
    
    @StateObject var vm: GameViewModel
    
    var body: some View {
        ZStack {
            VStack {
                HStack {
                    Text("Mines: \(vm.countMines)")
                        .foregroundStyle(.white)
                    
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
                    Text("Time: \(vm.counterTimer)")
                        .foregroundStyle(.white)
                    
                }
                GridView(rows: vm.rows, columns: vm.columns) { row, col in
                    let singleTap = TapGesture()
                        .onEnded { _ in
                            vm.click(row: row, column: col)
                            if vm.game.gameStatus == .lose {
                                vm.lose()
                            }
                        }
                    let doubleTap = TapGesture(count: 2)
                        .onEnded { _ in
                            vm.marked(row: row, column: col)
                            if vm.game.gameStatus == .win {
                                vm.win()
                            }
                        }
                    GameCellView(isActive: $vm.field[row][col].clicked, value: $vm.field[row][col].value, isMarked: $vm.field[row][col].marked)
                        .gesture(
                            doubleTap.exclusively(before: singleTap)
                        )
                        .disabled(vm.field[row][col].clicked || vm.field[row][col].marked)
                }
                .disabled((vm.game.gameStatus == .game || vm.game.gameStatus == .start) ? false : true)
            }
        }
    }
}
