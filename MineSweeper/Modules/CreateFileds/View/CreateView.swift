//
//  CreateView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 11.05.2025.
//

import SwiftUI

struct CreateView: View {
    @StateObject var vm = CreateFieldsViewModel()
    
    @State private var selectedRows: Int = 10
    @State private var selectedColumns: Int = 10
    
    let array = [4, 5,6,7,8,9,10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    
    var body: some View {
        VStack() {
            Spacer()
            Text("You can create a new field")
            
            HStack {
                Picker("rows", selection: $selectedRows) {
                    ForEach(array, id: \.self) { row in
                        Text("\(row)")
                            .foregroundStyle(.black)
                            .frame(height: 75)
                    }
                }
                .pickerStyle(.wheel)
                .frame(width: 100)
                .clipped()
                .onChange(of: selectedRows) { oldValue, newValue in
                    withAnimation {
                        vm.rows = newValue
                        vm.createField()
                    }
                }
                
                Text("X")
                
                Picker("columns", selection: $selectedColumns) {
                    ForEach(array, id: \.self) { col in
                        Text("\(col)")
                    }
                    
                }
                .pickerStyle(.wheel)
                .frame(width: 100)
                .clipped()
                .onChange(of: selectedColumns) { oldValue, newValue in
                    withAnimation {
                        vm.columns = newValue
                        vm.createField()
                    }
                }
                
            }
            .frame(maxHeight: 200)

            Spacer()
            
            GridView(rows: vm.rows, columns: vm.columns) { row, col in
                CellView(isActive: $vm.field[row][col])
                    .onTapGesture {
                        vm.field[row][col].toggle()
                    }
            }
            .frame(maxWidth: .infinity)
            .frame(maxHeight: UIScreen.main.bounds.height / 2)
            
            Spacer()
            
            Button ("Создать поле") {
                vm.clearField()
                vm.createBomb()
                vm.createMineSweeperField()
            }
            Spacer()
            
        }
    }
}

#Preview {
    CreateView()
}
