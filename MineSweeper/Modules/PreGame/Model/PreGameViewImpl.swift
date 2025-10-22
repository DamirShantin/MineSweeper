//
//  PreGameImpl.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 23.10.2025.
//

import Foundation
import SwiftUI

struct PreGameViewImpl: View {
    var vm = PreGameViewModel()
    var body: some View {
        PreGameView(vm: vm)
    }
}
