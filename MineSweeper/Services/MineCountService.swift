//
//  MineCountService.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation

final class MineCountService {
    func createNumbersOfBombs(rows: Int, columns: Int) -> Int {
        let queue = DispatchQueue(label: "countBombs", attributes: .concurrent)
        let totalCells = rows * columns
        var firstNumber: Double = 0
        var secondNumber: Double = 0
        var tirhdNumber: Double = 0
        var result: Int = 0
        
        firstNumber = 0.0002 * Double(totalCells * totalCells)
        secondNumber = 0.0938 * Double(totalCells)
        tirhdNumber = 0.8937

        result = Int(firstNumber + secondNumber + tirhdNumber)
        return result
    }
}
