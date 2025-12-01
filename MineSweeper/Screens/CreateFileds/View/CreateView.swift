//
//  CreateView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 11.05.2025.
//

import SwiftUI

struct CreateView: View {
    @StateObject var vm : CreateFieldsViewModel
    var storage: StorageModel
    
    @State private var selectedRows: Int = 4
    @State private var selectedColumns: Int = 4
    @State var showAlert: Bool  = false
    @State var nameOfField: String = ""
    
    let array = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    
    var body: some View {
        ZStack {
            Color.clear.frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Spacer()
                Text("You can create a new field")
                    .font(.title)
                
                HStack {
                    Picker("rows", selection: $selectedRows) {
                        ForEach(array, id: \.self) { row in
                            Text("\(row)")
                        }
                    }
                    .pickerStyle(.wheel)
                    .frame(width: 100)
                    .clipped()
                    .onChange(of: selectedRows) { oldValue, newValue in
                        withAnimation {
                            vm.rows = newValue
                            vm.createField()
                            vm.numberOfBombsInField() // test
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
                            vm.numberOfBombsInField() // test
                        }
                    }
                    
                }
                .frame(maxHeight: 200)
                
                Spacer()
                Text("\(vm.countBombs)")
                    .bold()
                    .foregroundStyle(.blue)
                Spacer()
                
                GridView(rows: vm.rows, columns: vm.columns) { row, col in
                    CreateCellView(isActive: $vm.field[row][col])
                        .onTapGesture {
                            vm.field[row][col].toggle()
                        }
                }
                .frame(maxWidth: .infinity)
                .frame(maxHeight: UIScreen.main.bounds.height / 2)
                
                Spacer()
                
                Button ("Создать поле") {
                    buttonCreateField()
                }
                .buttonStyle(.bordered)
                .foregroundStyle(.black)
                .disabled(!vm.isValid())
                .alert("Введите название", isPresented: $showAlert) {
                    TextField("Название", text: $nameOfField)
                    Button("Ок") {
                        buttonAlertOk(nameOfField)
                    }
                }
                
                Spacer()
                
            }
        }
    }
    
    func buttonCreateField() {
        vm.clearField()
        vm.createBomb()
        showAlert = true
    }
    
    func buttonAlertOk(_ nameOfField: String){
//        let name = vm.createNameField(name: nameOfField)
        self.storage.saveData(name: nameOfField, row: selectedRows, col: selectedColumns, bombs: vm.game.bombs)
        self.nameOfField = ""
        vm.clearField()
    }
}

