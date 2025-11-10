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
    
    @State private var selectedRows: Int = 4
    @State private var textRows: String = "4"
    @State private var selectedColumns: Int = 4
    @State private var textColumns: String = "4"
    @State private var showMines: Bool = false
    
    var range = RangeWrapper(lower: 4, upper: 20)
    
    var body: some View {
        ZStack{
            Color(hex: "#e9e0d3").ignoresSafeArea(edges: .all)

            VStack(spacing: 20) {
                Spacer()
                Text("Minesweeper")
                    .font(.system(size: 50, weight: .bold))
                    .foregroundColor(Color(hex: "#3B2F2A"))
                    .shadow(radius: 5, x: 0, y: 5)
                    .padding(.bottom, 50)
                VStack(alignment: .leading) {
                    Text("Количество рядов")
                    
                    SliderAndTextFieldView(value: $selectedRows, textValue: $textRows, imageOnSlider: Image(""), thumbSize: 40, accentColor: Color(hex: "#75784f"), sliderColor: Color(hex: "#915936"), range: range)
                }
                .onChange(of: selectedRows) { oldValue, newValue in
                    vm.rows = newValue
                    showMines = false
                    vm.countMines()
                }
                
                VStack(alignment: .leading) {
                    Text("Количество колонок")
                    
                    SliderAndTextFieldView(value: $selectedColumns, textValue: $textColumns, imageOnSlider: Image(""), thumbSize: 40, accentColor: Color(hex: "#75784f"), sliderColor: Color(hex: "#915936"), range: range)
                }
                .onChange(of: selectedColumns) { oldValue, newValue in
                    vm.columns = newValue
                    showMines = false
                    vm.countMines()
                }
                
                HStack{
                    if showMines {
                        Text("Количество мин: \(vm.minesCount)")
                            .lineLimit(1)
                    } else {
                        Text("Узнать количество мин")
                            .lineLimit(1)
                    }
                    
                    Spacer()
                    Toggle(isOn: $showMines){
                        //
                    }
                    .frame(width: 50)
                    
                }
                .padding(.horizontal, 20)
                Spacer()
                
                StartGameButton(text: "Start") {
                    vm.startGame()
                }
                
                Spacer()
            }
            .padding(.horizontal, 20)
        }
    }
}

#Preview {
    PreGameView(vm: PreGameViewModel())
}
