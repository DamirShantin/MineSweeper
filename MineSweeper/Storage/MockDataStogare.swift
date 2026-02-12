//
//  MockDataStogare.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 01.06.2025.
//

import Foundation

struct MockDataStogare: StorageModel{
    var fields: [Field] = []
    
    func saveData(name: String, row: Int, col: Int, bombs: [CoordField]) {
        //
    }
    
    func fetchData(name: String) -> Field? {
        return Field(name: "", rows: 1, columns: 1, bombs: [], id: UUID().uuidString)
    }
    
    func fetchBombs(name: String) -> [CoordField]? {
        return [CoordField]()
    }

    
    func loadData() {
        //
    }
    
    func deleteData(id: String) {
        //
    }
    
    var namesOfFields: [String] = ["Test1", "Test2"]
    var selectedField: Field?
    
    
}
