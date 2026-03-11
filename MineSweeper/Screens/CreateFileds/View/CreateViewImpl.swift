//
//  CreateViewImpl.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.05.2025.
//

import Foundation
import SwiftUI

struct CreateViewImpl: View {
    var field: GameField?
    var storage = StorageService.shared.storage
    
//    func createVM() -> CreateFieldsViewModel {
//        return CreateFieldsViewModel(field: field)
//    }
    
    var body: some View {
        CreateView(vm: CreateFieldsViewModel(gameField: field), storage: storage)
    }
}
