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
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(tags, id: \.self) { tag in
                    NavigationView {
                        HStack {
                            TagView(tag: tag)
                            Spacer()
                            NavigationLink(destination: MemorojTagView(tag: tag)) {
                                Text("Tout voir")
                                    .padding()
                                    .fontWeight(.light)
                            }
                        }
                    }
                    .frame(maxWidth: .infinity, maxHeight: 40)
                    ScrollView(.horizontal) {
                        LazyHGrid(rows: rows) {
                            let memorojForTag = getMemorojForTag(for: tag)
                            ForEach(memorojForTag.prefix(4), id: \.self) { memoro in
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
                NavigationView {
                    HStack {
                        TagView(tag: nil)
                        Spacer()
                        NavigationLink(destination: MemorojTagView(tag: nil)) {
                            Text("Tout voir")
                                .padding()
                                .fontWeight(.light)
                        }
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: 40)
                ScrollView(.horizontal) {
                    LazyHGrid(rows: rows) {
                        let memorojForTag = getMemorojForTag(for: nil)
                        ForEach(memorojForTag.prefix(4), id: \.self) { memoro in
                            NavigationLink(value: memoro) {
                                MemoroView(memoro: memoro)
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
    
    func deleteMemoro(at offsets: IndexSet) {
        for offset in offsets {
            let memoro = memoroj[offset]
            modelContext.delete(memoro)
        }
    }
    
    func getMemorojForTag(for tag: Tag? = nil) -> [Memoro] {
        if tag != nil {
            return memoroj.filter { $0.tag == tag}
            
        } else {
            return memoroj.filter { $0.tag == nil }
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
