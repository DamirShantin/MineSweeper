//
//  CreateView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 11.05.2025.
//

import SwiftUI

struct CreateView: View {
    @StateObject var vm = CreateFieldsViewModel()
    var body: some View {
        VStack() {
            Text("You can create a new field")
            Button ("Создать 20 Х 20") {
                vm.clearField()
                withAnimation {
                    vm.columns = 20
                    vm.rows = 20
                    vm.createField()
                }
                
                print("Поле обновилось")
            }
            
            Button ("Создать 15 Х 15") {
                vm.clearField()
                    withAnimation {
                        vm.columns = 15
                        vm.rows = 15
                        vm.createField()
                    }
                    
                
                print("Поле обновилось2")
            }
            
            Button ("Создать поле") {
                vm.clearField()
                vm.createBomb()
                vm.createMineSweeperField()
            }
            
            GridView(rows: vm.rows, columns: vm.columns) { row, col in
                CellView(isActive: $vm.field[row][col])
                    .onTapGesture {
                        vm.field[row][col].toggle()
                    }
            }
            .frame(maxWidth: .infinity)
            .frame(height: 400)
        }
    }
}

#Preview {
    CreateView()
}
