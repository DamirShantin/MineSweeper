//
//  StorageModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.05.2025.
//

import Foundation

protocol StorageModel{
    func saveData(name: String, row: Int, col: Int, bombs: [CoordField])
    func fetchData(name: String) -> Field?
    func loadData()
    
    var namesOfFields: [String] { get set }
    var selectedField: String? { get set }
}
