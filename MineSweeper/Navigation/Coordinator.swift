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
    
    enum Step: Hashable {
        case game, create, preGame
        
        var view: some View {
            Group {
                switch self {
                case .preGame: PreGameViewImpl()
                case .create: CreateViewImpl()
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
