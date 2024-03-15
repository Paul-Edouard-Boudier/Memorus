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
    var tag: Tag?
    @Query var memoroj: [Memoro]

    let columns = [GridItem(.adaptive(minimum: 200))]
    
    var body: some View {
        let memorojForTag = getMemorojForTag(for: tag)
        
        Section {
            TagView(tag: tag)
        }
        Section {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(memorojForTag, id: \.self) { memoro in
                        if memoro.tag?.tagName == tag?.tagName {
                            MemoroView(memoro: memoro)
                                .padding(.trailing)
                        }
                    }
                }
            }
            
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
        return MemorojTagView(tag: previewer.tag)
                .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
