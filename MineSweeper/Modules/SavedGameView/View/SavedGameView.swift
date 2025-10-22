//
//  GameView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import SwiftUI

struct SavedGameView: View {
    
    @StateObject var vm: SavedGameViewModel
    @State private var alertPresented: Bool = false
    var body: some View {
        ZStack {
            VStack {
                Text(vm.selectedField)
                
                GridView(rows: vm.rows, columns: vm.columns) { row, col in
                    let singleTap = TapGesture()
                        .onEnded { _ in
                            vm.click(row: row, column: col)
                            if vm.game.gameStatus != .game {
                                self.alertPresented = true
                            }
                        }
                    let doubleTap = TapGesture(count: 2)
                        .onEnded { _ in
                            vm.marked(row: row, column: col)
                            if vm.game.gameStatus != .game {
                                self.alertPresented = true
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
            .alert(vm.alertLabel, isPresented: $alertPresented) {
                Button("Ok"){
                    Coordinator.shared.back()
                }
            }
        }
    }
}

//#Preview {
//    GameView()
//}
