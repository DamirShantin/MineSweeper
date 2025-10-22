//
//  GameViewImpl.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.05.2025.
//

import Foundation
import SwiftUI

struct PreSavedGameViewImpl: View {
//    var storage: StorageModel = MockDataStogare()
    var vm: PreSavedGameViewModel = {
        var storage: StorageModel = StorageService.shared.storage
        var vm = PreSavedGameViewModel(storage: storage)
        return vm
    }()
    
    var body: some View {
        PreSavedGameView(vm: vm)
    }
}
