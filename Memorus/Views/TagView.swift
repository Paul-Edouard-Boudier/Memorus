//
//  TagView.swift
//  Memorus
//
//  Created by Paul-Edouard Boudier on 10/03/2024.
//

import SwiftUI

struct TagView: View {
    @Environment(\.modelContext) var modelContext
    var tag: Tag?
    
    var body: some View {
        Section {
            Text(tag?.tagName ?? "Aucun tag")
                .padding(.leading)
                .fontWeight(/*@START_MENU_TOKEN@*/.semibold/*@END_MENU_TOKEN@*/)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
        }
        
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        return TagView(tag: previewer.tag)
                .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
