//
//  StorageModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.05.2025.
//

import Foundation

protocol StorageModel{
    func saveData(name: String, field: [[GameCell]])
    func saveBombs(name: String, bombs: [CoordField])
    func fetchData(name: String) -> [[GameCell]]?
    func fetchBombs(name: String) -> [CoordField]?
    func loadData()
    
    var namesOfFields: [String] { get set }
    var selectedField: String? { get set }
}
