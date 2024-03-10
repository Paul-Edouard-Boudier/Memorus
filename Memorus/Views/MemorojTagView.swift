//
//  MemorojTagView.swift
//  Memorus
//
//  Created by Paul-Edouard Boudier on 10/03/2024.
//

import SwiftUI
import SwiftData

struct MemorojTagView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var tag: Tag
    @Query var memoroj: [Memoro]
    
    
    let columns = [GridItem(.adaptive(minimum: 200))]
    
    var body: some View {
        Section {
            TagView(tag: tag)
        }
        Section {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(memoroj, id: \.self) { memoro in
                        if memoro.tag?.tagName == tag.tagName {
                            MemoroView(memoro: memoro)
                                .padding(.trailing)
                        }
                    }
                }
            }
            
        }
        
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return MemorojTagView(tag: previewer.tag)
                .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
