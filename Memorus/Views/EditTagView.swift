//
//  EditTagView.swift
//  Memorus
//
//  Created by Paul-Edouard Boudier on 12/03/2024.
//

import SwiftUI
import SwiftData

struct EditTagView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.presentationMode) var presentationMode
    @Bindable var tag: Tag
    @Binding var navigationPath: NavigationPath
    @Binding var comeFromMemoro: Bool
    
    var body: some View {
        Form {
            Section("Le titre du tag") {
                TextField("Title", text: $tag.tagName)
                    .textContentType(.name)
            }
        }
        .navigationTitle("Modifier \($tag.tagName)")
        .navigationBarItems(trailing: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            Text("Annuler")
        })
        Button(action: {
            saveTag(tag: tag)
        }) {
            Text("Enregistrer")
        }
//        NavigationLink(destination: ContentView()) {
//            Text("Ajouter un tag")
//        }
        
    }
    
    private func saveTag(tag: Tag) {
        modelContext.insert(tag)
//        navigationPath.append(tag)
        if comeFromMemoro == false {
            navigationPath.removeLast(navigationPath.count)
            
        }
        self.presentationMode.wrappedValue.dismiss()
    }
}

#Preview {
    do {
        let previewer = try Previewer()
        @State var comeFromMemoro: Bool = false
        
        return EditTagView(tag: previewer.tag, navigationPath: .constant(NavigationPath()), comeFromMemoro: $comeFromMemoro)
                .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
