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
        VStack {
            HeaderGameView(gameStatus: vm.game.gameStatus, countMines: 0, timeString: "0:00")
            Spacer()
            ScrolingGameFieldView(rows: vm.rows, columns: vm.columns) {
                SavedGameFieldView(vm: vm)
            }
            Spacer()
            
        }
    }
}

//#Preview {
//    GameView()
//}
