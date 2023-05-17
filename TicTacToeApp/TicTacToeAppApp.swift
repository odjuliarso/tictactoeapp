//
//  TicTacToeAppApp.swift
//  TicTacToeApp
//
//  Created by Othman Djuliarso on 5/16/23.
//

import SwiftUI

@main
struct TicTacToeAppApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
