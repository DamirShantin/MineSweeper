//
//  MineCountService.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation

final class MineCountService {
    func createNumbersOfBombs(rows: Int, columns: Int) -> Int {
        let totalCells = rows * columns
        var firstNumber: Double = 0
        var secondNumber: Double = 0
        var tirhdNumber: Double = 0
        var result: Int = 0
        
        let queue = DispatchQueue(label: "MineCountQueue", qos: .userInteractive, attributes: .concurrent)
        let semaphore = DispatchSemaphore(value: 0)
        
        queue.async {
            firstNumber = 0.0002 * Double(totalCells * totalCells)
            secondNumber = 0.0938 * Double(totalCells)
            tirhdNumber = 0.8937
        }
        
        queue.async(flags: .barrier) {
            result = Int(firstNumber + secondNumber + tirhdNumber)
            semaphore.signal()
        }
        
        semaphore.wait()
        return result
    }
}
