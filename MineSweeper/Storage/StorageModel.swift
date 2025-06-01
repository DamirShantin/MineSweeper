//
//  StorageModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.05.2025.
//

import Foundation

protocol StorageModel{
    func saveData(name: String, field: [[Int]])
    func fetchData(name: String) -> [[Int]]?
    func loadData()
    
    var namesOfFields: [String] { get set }
}
