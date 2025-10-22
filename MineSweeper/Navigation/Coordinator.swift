//
//  Coordinator.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 11.05.2025.
//

import Foundation
import SwiftUI

final class Coordinator: ObservableObject {
    static var shared = Coordinator()
    
    @Published var path = [Step]()
    var demention: CoordField?
    
    enum Step: Hashable {
        case savedGame, preSavedGame, create, preGame, game
        var view: some View {
            Group {
                switch self {
                case .preSavedGame: PreSavedGameViewImpl()
                case .create: CreateViewImpl()
                case .savedGame: SavedGameViewImpl()
                case .preGame: PreGameViewImpl()
                case .game: GameViewImpl()
                }
            }
        }
    }
    
    func next(_ val: Step) {
        Task {
            await MainActor.run {
                path += [val]
            }
        }
    }
    
    func back(){
        Task{
            await MainActor.run {
                path.removeLast()
            }
        }
    }
    
}
