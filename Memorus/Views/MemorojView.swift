//
//  MemorojView.swift
//  Memorus
//
//  Created by Paul-Edouard Boudier on 28/02/2024.
//

import SwiftUI
import SwiftData

struct MemorojView: View {
    @Environment(\.modelContext) var modelContext
    @Query var memoroj: [Memoro]
    
    var body: some View {
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        List {
            ForEach(memoroj) { memoro in
                NavigationLink(value: memoro) {
                    Text(memoro.title)
                }
                
            }
            .onDelete(perform: deleteMemoro)
        }
    }
    
    func deleteMemoro(at offsets: IndexSet) {
        for offset in offsets {
            let memoro = memoroj[offset]
            modelContext.delete(memoro)
        }
    }
    
}


#Preview {
    do {
        let previewer = try Previewer()
        return MemorojView().modelContainer(previewer.container)
        
    } catch {
        return Text("Failed to create preview \(error.localizedDescription)")
    }
}


//#Preview {
//    MemorojView()
//}
