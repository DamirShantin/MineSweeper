//
//  GameViewImpl.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import Foundation
import SwiftUI

struct GameViewImpl: View {
    
    var game: GameMineSweeper {
        let gameLogic = GameLogicMineSweeper()
        let storage = SingltonStorage.shared
        let game = GameMineSweeper(storage: storage, gameLogic: gameLogic)
        return game
    }
    
    var vm: GameViewModel{
        let game = self.game
        let vm = GameViewModel(game: game)
        return vm
    }
    
    var body: some View {
        GameView(vm: vm)
    }
}
