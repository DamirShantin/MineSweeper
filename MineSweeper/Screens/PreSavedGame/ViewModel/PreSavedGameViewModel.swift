//
//  GameViewModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import Foundation

class PreSavedGameViewModel: ObservableObject{
    
    @Published var fields = [GameField]()
    
    var storage: StorageModel
    
    init(storage: StorageModel) {
        self.storage = storage
        loadFields()
    }
    
    private func loadFields() {
        self.fields = storage.fields
    }
    
    func deleteField(id: String){
        storage.deleteData(id: id)
        loadFields()
    }
    
    func detailField(id: String){
        //
    }

}
