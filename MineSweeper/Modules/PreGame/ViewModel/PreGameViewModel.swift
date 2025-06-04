//
//  GameViewModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import Foundation

class PreGameViewModel: ObservableObject{
    
    var storage: StorageModel
    
    init(storage: StorageModel) {
        self.storage = storage
    }
}
