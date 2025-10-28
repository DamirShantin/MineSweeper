//
//  PreGameView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation
import SwiftUI

struct PreGameView: View {
    
    @StateObject var vm: PreGameViewModel

    let array = [4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20]
    
    @State private var selectedRows: Int = 4
    @State private var selectedColumns: Int = 4
    @State private var showMines: Bool = false
    
    var body: some View {
        ZStack{
            Color.clear.frame(maxWidth: .infinity, maxHeight: .infinity)
            VStack {
                Text("Выбираем сложность")
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
                        vm.rows = newValue
                        showMines = false
                        vm.countMines()
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
                        vm.columns = newValue
                        showMines = false
                        vm.countMines()
                    }
                }
                
                HStack{
                    if showMines {
                        Text("Количество мин: \(vm.minesCount)")
                    } else {
                        Text("Узнать количество мин")
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    Toggle(isOn: $showMines){
                        //
                    }
                    
                }
                .padding(.horizontal, 30)
                
                
                Button ("Играть") {
                    vm.startGame()
                }
                
            }
        }
    }
}
