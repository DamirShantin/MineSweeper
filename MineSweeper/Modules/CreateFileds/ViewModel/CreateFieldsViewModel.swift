//
//  CreateFieldsViewModel.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 12.05.2025.
//

import Foundation

class CreateFieldsViewModel: ObservableObject {
    @Published var field = [[Bool]]()
    
    var rows: Int
    var columns: Int
    
    init(){
        print("init create")
        self.rows = 10
        self.columns = 10
        createField()
        
    }
    
    func createField() {
        let grid = Array(repeating: Array(repeating: true, count: self.columns), count: rows)
        self.field = grid
        print("\(rows) X \(columns)")
    }
}
