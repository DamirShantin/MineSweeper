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
    
    @State private var rows: Int = 4
    @State private var columns: Int = 4
    @State private var rowsText: String = "4"
    @State private var columnsText: String = "4"
    @State var showAlert: Bool  = false
    @State var nameOfField: String = ""
    var range: RangeWrapper
    
    let paramHorPadding: CGFloat = 16
    
    var body: some View {
        ZStack {
            Color(hex: "#E8DCC8")
                .ignoresSafeArea()
            
            VStack(spacing: 0) {
                Text("Create Field")
                    .font(.system(size: 40, weight: .bold))
                    .foregroundStyle(Color(hex: "#3B2F2A"))
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, paramHorPadding)
                    .padding(.top, 8)
                
                    VStack(spacing: 10) {
                        // Controls card
                        VStack(spacing: 16) {
                            // Rows control
                            HStack {
                                Text("Количество рядов")
                                    .font(.system(size: 17))
                                    .foregroundStyle(Color(hex: "#3B2F2A"))
                                
                                Spacer()
                                
                                HStack(spacing: 4) {
                                    Button {
                                        if rows > range.lowerBoundInt {
                                            rows -= 1
                                            rowsText = "\(rows)"
                                            vm.updateField(.row, value: rows)
                                        }
                                    } label: {
                                        Image(systemName: "minus")
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundStyle(Color(hex: "#3B2F2A"))
                                            .frame(width: 32, height: 32)
                                            
                                    }
                                    
                                    Rectangle()
                                        .frame(width: 1, height: 20)
                                        .foregroundStyle(Color.gray)
                                    
                                    TextField("", text: $rowsText)
                                        .keyboardType(.numberPad)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundStyle(Color(hex: "#3B2F2A"))
                                        .frame(width: 40)
                                        .onChange(of: rowsText) {
                                            validateAndSync(.row, rowsText)
                                        }
                                    
                                    
                                    Rectangle()
                                        .frame(width: 1, height: 20)
                                        .foregroundStyle(Color.gray)
                                    
                                    Button {
                                        if rows < range.upperBoundInt {
                                            rows += 1
                                            rowsText = "\(rows)"
                                            vm.updateField(.row, value: rows)
                                        }
                                    } label: {
                                        Image(systemName: "plus")
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundStyle(Color(hex: "#3B2F2A"))
                                            .frame(width: 32, height: 32)
                                            
                                    }
                                }
                                .background(Color(hex: "#E8DCC8"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                                
                            }
                            
                            Divider()
                                .background(Color(hex: "#CBB094"))
                            
                            // Columns control
                            HStack {
                                Text("Количество колонок")
                                    .font(.system(size: 17))
                                    .foregroundStyle(Color(hex: "#3B2F2A"))
                                
                                Spacer()
                                
                                HStack(spacing: 4) {
                                    Button {
                                        if columns > range.lowerBoundInt {
                                            columns -= 1
                                            columnsText = "\(columns)"
                                            vm.updateField(.column, value: columns)
                                        }
                                    } label: {
                                        Image(systemName: "minus")
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundStyle(Color(hex: "#3B2F2A"))
                                            .frame(width: 32, height: 32)
                                            
                                    }
                                    
                                    Rectangle()
                                        .frame(width: 1, height: 20)
                                        .foregroundStyle(Color.gray)
                                    
                                    TextField("", text: $columnsText)
                                        .keyboardType(.numberPad)
                                        .multilineTextAlignment(.center)
                                        .font(.system(size: 16, weight: .bold))
                                        .foregroundStyle(Color(hex: "#3B2F2A"))
                                        .frame(width: 40)
                                        .onChange(of: columnsText) {
                                            validateAndSync(.column, columnsText)
                                        }
                                    
                                    Rectangle()
                                        .frame(width: 1, height: 20)
                                        .foregroundStyle(Color.gray)
                                    
                                    Button {
                                        if columns < range.upperBoundInt {
                                            columns += 1
                                            columnsText = "\(columns)"
                                            vm.updateField(.column, value: columns)
                                        }
                                    } label: {
                                        Image(systemName: "plus")
                                            .font(.system(size: 14, weight: .semibold))
                                            .foregroundStyle(Color(hex: "#3B2F2A"))
                                            .frame(width: 32, height: 32)
                                            
                                    }
                                }
                                .background(Color(hex: "#E8DCC8"))
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            }
                        }
                        .padding()
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(.white)
                        )
                        .padding(.horizontal, paramHorPadding)
                        
                        // Mine placement hint
                        HStack(spacing: 2) {
                            Image("bomb")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 15, height: 15)
                                .padding(8)
                                .background(
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color(hex: "#E6D9C8"))
                                )
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color(hex: "#CBB094"), lineWidth: 1)
                                )
                            
                            Text("Нажми на клетку, чтобы поставить мину")
                                .font(.system(size: 13))
                                .foregroundStyle(Color(hex: "#3B2F2A"))
                            
                            Spacer()
                            
                            Text("5 мин")
                                .font(.system(size: 12, weight: .semibold))
                                .foregroundStyle(.white)
                                .padding(.horizontal, 12)
                                .padding(.vertical, 6)
                                .background(
                                    Capsule()
                                        .fill(Color(hex: "#7d3f14"))
                                        .frame(width: 50)
                                )
                        }
                        .padding(.horizontal, paramHorPadding)
                        
                        
                        
                        GridView(rows: rows, columns: columns, spacing: 2) { row, col in
                            CreateGameCellView(isActive: $vm.field[row][col])
                                .onTapGesture { vm.field[row][col].toggle() }
                        }
                        .padding(8)
                        .background(
                            RoundedRectangle(cornerRadius: 16)
                                .fill(Color(hex: "#D8C3A5"))
                        )
                        .frame(height: 400)
                        .padding(.horizontal, paramHorPadding)
                        
                        
                      Spacer()
                        
                        // Save button
                        Button {
                            buttonCreateField()
                        } label: {
                            Text("Save Field")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(Color(hex: "#3B2F2A"))
                                .frame(maxWidth: .infinity)
                                .frame(height: 56)
                                .background(
                                    RoundedRectangle(cornerRadius: 16)
                                        .fill(Color(hex: "#CBB094"))
                                )
                        }
                        .padding(.horizontal, paramHorPadding)
                        .padding(.bottom, 34)
                        .disabled(!vm.isValid())
                        .alert("Введите название", isPresented: $showAlert) {
                            TextField("Название", text: $nameOfField)
                            Button("Ок") {
                                buttonAlertOk(nameOfField)
                            }
                        }
                    }
                    .padding(.top, 16)
                
            }
        }
    }
    
    func buttonCreateField() {
            showAlert = true
        }
    
        func buttonAlertOk(_ nameOfField: String){
    //        let name = vm.createNameField(name: nameOfField)
            self.storage.saveData(name: nameOfField, row: rows, col: columns, bombs: vm.createBomb())
            self.nameOfField = ""
            vm.clearField()
        }
    
    private func validateAndSync(_ with: PeiceField, _ text: String) {
        let filtered = text.filter { $0.isNumber }
        
        switch with {
        case .row:
            if filtered != text {
                rowsText = filtered
            }
            if let num = Int(filtered) {
                if range.contains(num) {
                    rows = num
                } else {
                    rows = min(max(num, range.lowerBoundInt), range.upperBoundInt)
                    rowsText = String(rows)
                }
            }

        case .column:
            if filtered != text {
                columnsText = filtered
            }
            if let num = Int(filtered) {
                if range.contains(num) {
                    columns = num
                } else {
                    columns = min(max(num, range.lowerBoundInt), range.upperBoundInt)
                    columnsText = String(columns)
                }
            }
        }
        
        
    }
}
