


import Foundation
import SwiftUI

struct SavedGameViewImpl: View {
    
    
    func createVM() -> SavedGameViewModel{
        let gameLogic = SavedGameLogicMineSweeper()
        let storage = StorageService.shared.storage
        let game = SavedGameMineSweeper(storage: storage, gameLogic: gameLogic)
        let vm = SavedGameViewModel(game: game)
        return vm
    }


var body: some View {
    SavedGameView(vm: createVM())
    }
}
