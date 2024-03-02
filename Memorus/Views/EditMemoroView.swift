//
//  EditMemoroView.swift
//  Memorus
//
//  Created by Paul-Edouard Boudier on 01/03/2024.
//

import SwiftUI
import SwiftData

struct EditMemoroView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var memoro: Memoro
    @Binding var navigationPath: NavigationPath
    @Query(sort: [SortDescriptor(\Tag.tagName),]) var tags: [Tag]
    
    
    var body: some View {
        Form {
            Section("titre du memoro") {
                TextField("Title", text: $memoro.title)
                    .textContentType(.name)
            }
            Section {
//                TextField("Body of memoro", text: $memoro.body)
                TextEditor(text: $memoro.body)
//                    .foregroundColor(Color.gray)
//                    .font(.custom("HeleveticaNeue", size: 17))
                    .padding(.horizontal)
                    .navigationTitle("Body of memoro")
//                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
            }
        }
//        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

//#Preview {
//    EditMemoroView()
//}

#Preview {
    do {
        let previewer = try Previewer()
        
        return EditMemoroView(memoro: previewer.memoro, navigationPath: .constant(NavigationPath()))
                .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}

