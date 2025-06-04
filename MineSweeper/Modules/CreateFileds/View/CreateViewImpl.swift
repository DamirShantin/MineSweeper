//
//  CreateViewImpl.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.05.2025.
//

import Foundation
import SwiftUI

struct CreateViewImpl: View {
    var vm = CreateFieldsViewModel()
    var storage = StorageService.shared.storage
    
    var body: some View {
        CreateView(vm: vm, storage: storage)
    }
}
