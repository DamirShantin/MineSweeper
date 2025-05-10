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
        case game, create
        
        var view: some View {
            Group {
                switch self {
                case .game: GameView()
                case .create: CreateView()
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
    
}
