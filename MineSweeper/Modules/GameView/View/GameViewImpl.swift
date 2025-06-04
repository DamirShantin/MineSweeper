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
        var gameLogic = GameLogicMineSweeper()
        var storage = SingltonStorage.shared
        let game = GameMineSweeper(storage: storage, gameLogic: gameLogic)
        return game
    }
    
    var vm: GameViewModel{
        var game = self.game
        var vm = GameViewModel(game: game)
        return vm
    }
    
    var body: some View {
        GameView(vm: vm)
    }
}
