//
//  SingltonStorage.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.05.2025.
//

import Foundation

final class SingltonStorage: StorageModel {
   
    static var shared = SingltonStorage()
    private init() {}
    
    var storage = [String : Field]()
    var storageBombs = [String : [CoordField]]()
    var namesOfFields = [String]()
    var selectedField: String?
    
    func saveData(name: String, row: Int, col: Int, bombs: [CoordField]) {
        let field = Field(name: name, rows: row, columns: col, bombs: bombs, id: UUID().uuidString)
        storage[name] = field
        namesOfFields.append(name)
    }
    
    func fetchData(name: String) -> Field? {
        if let data = storage[name] {
            return data
        }
        return nil
    }
    
    func loadData() {
        //
    }
    
    func deleteData(name: String) {
        storage[name] = nil
        namesOfFields.removeAll { $0 == name }
    }
    
}
