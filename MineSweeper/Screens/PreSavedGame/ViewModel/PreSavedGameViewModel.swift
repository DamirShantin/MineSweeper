//
//  GameViewModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import Foundation

class PreSavedGameViewModel: ObservableObject{
    
    @Published var fields = [Field]()
    
    var storage: StorageModel
    
    init(storage: StorageModel) {
        self.storage = storage
        loadFields()
    }
    
    private func loadFields() {
        let _ = storage.namesOfFields.map { name in
            guard let field = storage.fetchData(name: name) else { return }
            fields.append(field)
        }
    }
}
