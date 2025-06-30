//
//  MineSweeperApp.swift
//  MineSweeper
//
//  Created by Дамир Шаймуханбетов on 28.04.2025.
//

import SwiftUI

@main
struct MineSweeperApp: App {
    @Environment(\.scenePhase) var scenePhase
    let persistenceController = CoreDataStorage.shared
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.persistentContainer.viewContext)
        }
        .onChange(of: scenePhase) {
            persistenceController.saveContext()
        }
    }
}
