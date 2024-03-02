//
//  ContentView.swift
//  Memorus
//
//  Created by Paul-Edouard Boudier on 23/02/2024.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Query private var memoroj: [Memoro]
    
    @State private var path = NavigationPath()
    @State private var searchText = ""
    @Environment(\.modelContext) private var modelContext
    
    
    var body: some View {
        NavigationStack(path: $path) {
            MemorojView()
            .navigationTitle("Les memoroj")
            .navigationDestination(for: Memoro.self) { memoro in
                EditMemoroView(memoro: memoro, navigationPath: $path)
            }
        }
    }
    
    private func addMemoro() {
        let memoro = Memoro(title: "", body: "")
        modelContext.insert(memoro)
        path.append(memoro)
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return ContentView().modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview \(error.localizedDescription)")
    }
    
}
//
//#Preview {
//    ContentView()
//        .modelContainer(for: Item.self, inMemory: true)
//}
