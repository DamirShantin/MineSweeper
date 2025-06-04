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
                GameCellView(isActive: $vm.field[row][col].clicked)
                    .onTapGesture {
                        vm.click(row: row, column: col)
                        
                    }
            }
        }
    }
}

//#Preview {
//    GameView()
//}
