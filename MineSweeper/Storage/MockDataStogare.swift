//
//  MockDataStogare.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 01.06.2025.
//

import Foundation

struct MockDataStogare: StorageModel{
    
//    let fiseld1 = [
//    [0,0,]
//    ]
    
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
