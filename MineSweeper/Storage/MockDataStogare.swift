//
//  MockDataStogare.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 01.06.2025.
//

import Foundation

struct MockDataStogare: StorageModel{
    func saveBombs(name: String, bombs: [CoordField]) {
        
    }
    
    func fetchBombs(name: String) -> [CoordField]? {
        return [CoordField]()
    }
    
    

    
    func saveData(name: String, field: [[GameCell]]) {
        //
    }
    
    func fetchData(name: String) -> [[GameCell]]? {
        return [[]]
    }
    
    func loadData() {
        //
    }
    
    var namesOfFields: [String] = ["Test1", "Test2"]
    var selectedField: String?
    
    
}
