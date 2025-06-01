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
    
    func saveData(name: String, field: [[Int]]) {
        //
    }
    
    func fetchData(name: String) -> [[Int]]? {
        return [[]]
    }
    
    func loadData() {
        //
    }
    
    var namesOfFields: [String] = ["Test1", "Test2"]
    
    
}
