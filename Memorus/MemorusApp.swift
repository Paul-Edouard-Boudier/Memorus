//
//  MemorusApp.swift
//  Memorus
//  From Esperanto Memori -> to remember something
//  Memorus means -> i will remember
//
//  Created by Paul-Edouard Boudier on 23/02/2024.
//

import SwiftUI
import SwiftData

@main
struct MemorusApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            Memoro.self,
            Tag.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
