//
//  CreateViewImpl.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 29.05.2025.
//

import Foundation
import SwiftUI

struct CreateViewImpl: View {
    @StateObject var vm = CreateFieldsViewModel()
    var storage = SingltonStorage.shared
    
    var body: some View {
        CreateView(vm: vm as CreateFieldsViewModel, storage: storage as StorageModel)
    }
}
