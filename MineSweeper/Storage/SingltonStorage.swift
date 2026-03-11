//
//  SingltonStorage.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.05.2025.
//

import Foundation

final class SingltonStorage: StorageModel {
    var fields: [GameField] = []
    
   
    static var shared = SingltonStorage()
    private init() {
        loadData()
    }
    
    var storage = [String : GameField]()
    var storageBombs = [String : [CoordField]]()
    var selectedField: GameField?
    
    func saveData(name: String, row: Int, col: Int, bombs: [CoordField]) {
        let field = GameField(name: name, rows: row, columns: col, bombs: bombs, id: UUID().uuidString)
        storage[field.id] = field
    }
    
    func loadData() {
        let _ = storage.map { fields.append($0.value)}
    }
    
    func deleteData(id: String) {
        fields.removeAll { $0.id == id }
        storage[id] = nil
    }
    
}
