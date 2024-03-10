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
    @Query var tags: [Tag]
    let columns = [GridItem(.adaptive(minimum: 200))]
    let rows = [GridItem(.fixed(30))]
//    var i: Int = 0, j: Int = 0
    
    var body: some View {
        var i: Int = 0, j: Int = 0
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(tags, id: \.self) { tag in
//                    j = 0
                    TagView(tag: tag)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows) {
                            ForEach(memoroj, id: \.self) { memoro in
                                if memoro.tag == tag {
                                    NavigationLink(value: memoro) {
                                        MemoroView(memoro: memoro)
                                            
                                    }
                                    
                                }
                            }
                            .onDelete(perform: deleteMemoro)
                        }
                    }
                    .padding(.trailing)
                    Divider()
                }
                
            }
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
