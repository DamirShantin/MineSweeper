//
//  GameViewImpl.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.05.2025.
//

import Foundation
import SwiftUI

struct PreGameViewImpl: View {
//    var storage: StorageModel = MockDataStogare()
    var vm: PreGameViewModel = {
        var storage: StorageModel = StorageService.shared.storage
        var vm = PreGameViewModel(storage: storage)
        return vm
    }()
    
    var body: some View {
        PreGameView(vm: vm)
    }
}
