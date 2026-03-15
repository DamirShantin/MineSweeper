//
//  DetailFieldImply.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 15.03.2026.
//


import SwiftUI

struct DetailFieldViewImpl: View {
    var field: GameField
    
    init(field: GameField) {
        self.field = field
    }
    
    func createVM() -> DetailFieldViewModel {
        DetailFieldViewModel(field: field)
    }
    
    var body: some View {
        DetailField(vm: createVM())
    }
}
