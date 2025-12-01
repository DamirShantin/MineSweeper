//
//  PickerModalView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 02.06.2025.
//

import Foundation
import SwiftUI

struct PickerModalView: View {
    @Binding var selected: String
//    @Environment (\.presentationMode) var presentationMode
    var items: [String]
    var body: some View{
        VStack {
            Picker("Выберите ", selection: $selected){
                ForEach(items, id: \.self) { item in
                Text(item)
                }
            }
            .pickerStyle(.wheel)
            
            Button("OK") {
//                presentationMode.wrappedValue.dismiss()
            }
            .buttonStyle(.bordered)
            .frame(width: 100)
        }
    }
}

