//
//  StorageModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.05.2025.
//

import Foundation

protocol StorageModel{
    func saveData(name: String, row: Int, col: Int, bombs: [CoordField])
    func loadData()
    func deleteData(id: String)
    
    var fields: [GameField] { get set } 
    var selectedField: GameField? { get set }
}
