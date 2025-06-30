//
//  ContentView.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 28.04.2025.
//

import SwiftUI

struct ContentView: View {
    @StateObject var main = Coordinator.shared
    var body: some View {
        ZStack {
            NavigationStack (path: $main.path) {
                MenuView()
                
                Group {}
                    .navigationDestination(for: Coordinator.Step.self) { destination in
                        destination.view
                    }
            }
        }
    }
}

//#Preview {
//    ContentView()
//}
