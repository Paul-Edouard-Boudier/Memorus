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
//    @State private var searchText = ""
//    @State private var sortMemoro = [SortDescriptor(\Memoro.title)]
//    @State private var sortTag = [SortDescriptor(\Tag.tagName)]
    @Environment(\.modelContext) private var modelContext
    
    
    var body: some View {
        NavigationStack(path: $path) {
            MemorojView()
            .navigationTitle("Les memoroj")
            .navigationDestination(for: Memoro.self) { memoro in
                EditMemoroView(memoro: memoro, navigationPath: $path)
            }
            .toolbar {
                Button("Ajouter", systemImage: "plus", action: addMemoro)
    //            Button("Add Person", systemImage: "plus", action: addPerson)
    ////            Tip: Wrapping the Picker in a Menu means we get a nice sort icon in the navigation bar, rather than seeing "Name (A-Z)" up there.
    //            Menu("Sort", systemImage: "arrow.up.arrow.down") {
    //                Picker("Sort", selection: $sortOrder) {
    //                    Text("Name (A-Z)")
    //                        .tag([SortDescriptor(\Person.name)])
    //                    Text("Name (Z-A)")
    //                        .tag([SortDescriptor(\Person.name, order: .reverse)])
    //                }
    //            }
            }
        }
        
//        .searchable(text: $searchText)
    }
    
    private func addMemoro() {
        let memoro = Memoro(title: "", body: "")
//        modelContext.insert(memoro)
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
