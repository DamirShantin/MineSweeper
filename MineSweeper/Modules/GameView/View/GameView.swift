//
//  GameView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import SwiftUI

struct GameView: View {
    
    @StateObject var vm: GameViewModel
    var body: some View {
        VStack {
            Text(vm.selectedField)
            
            GridView(rows: vm.rows, columns: vm.columns) { row, col in
                let singleTap = TapGesture()
                    .onEnded { _ in
                        vm.click(row: row, column: col)
                        print("1 tap")
                    }
                let doubleTap = TapGesture(count: 2)
                    .onEnded { _ in
                        vm.marked(row: row, column: col)
                        print("2 tap")
                    }
                
                
                GameCellView(isActive: $vm.field[row][col].clicked, value: $vm.field[row][col].value, isMarked: $vm.field[row][col].marked)
                    .gesture(
                        doubleTap.exclusively(before: singleTap)
                    )
                
//                    .onTapGesture {
//                        vm.click(row: row, column: col)
//                    }
//                    .onTapGesture(count: 2) {
//                        vm.marked(row: row, column: col)
//                    }
                    .disabled(vm.field[row][col].clicked || vm.field[row][col].marked)
            }
            .disabled(vm.game.gameStatus == .game ? false : true)
        }
    }
}

//#Preview {
//    GameView()
//}
