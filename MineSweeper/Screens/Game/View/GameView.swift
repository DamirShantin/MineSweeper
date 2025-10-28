//
//  GameView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 26.10.2025.
//

import Foundation
import SwiftUI

struct GameView: View {
    @StateObject var vm: GameViewModel
    
    var body: some View {
        VStack {
            HeaderGameView(gameStatus: vm.game.gameStatus, countMines: vm.countMines, timeString: vm.timeString)
            Spacer()
            ScrolingGameFieldView(rows: vm.rows, columns: vm.columns) {
                GameFieldView(vm: vm)
            }
            Spacer()
            
        }
        
        
    }
}
