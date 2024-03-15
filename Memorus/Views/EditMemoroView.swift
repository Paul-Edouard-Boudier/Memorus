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
    @Environment(\.presentationMode) var presentationMode
    
    @Bindable var memoro: Memoro
    @Binding var navigationPath: NavigationPath
    @State var comeFromMemoro: Bool = true
    
    @Query(sort: [SortDescriptor(\Tag.tagName),]) var tags: [Tag]
    var newTag = Tag(tagName: "")
    
    
    var body: some View {
        Form {
//            NavigationView {
                Section("titre du memoro") {
                    TextField("Title", text: $memoro.title)
                        .textContentType(.name)
                }
                Section("Le contenu du memoro") {
                    //                TextField("Body of memoro", text: $memoro.body)
                    TextEditor(text: $memoro.body)
                    //                    .foregroundColor(Color.gray)
                    //                    .font(.custom("HeleveticaNeue", size: 17))
                        .padding(.horizontal)
                        .navigationTitle("Body of memoro")
                        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity, alignment: .center)
                }
                Section("Tag du memoro") {
                    Picker("Tag", selection: $memoro.tag) {
                        Text("Aucun tag")
                            .tag(Optional<Tag>.none)
                        if tags.isEmpty == false {
                            Divider()
                            ForEach(tags) { tag in
                                Text(tag.tagName)
                                    .tag(Optional(tag))
                            }
                        }
                    }
                    //                NavigationView {
                    //                    NavigationLink(destination: EditTagView())
                    //                }
//                    Button("Ajouter un nouveau tag", action: addTag)
                    NavigationLink(destination: EditTagView(
                        tag: newTag, 
                        navigationPath: $navigationPath, comeFromMemoro: $comeFromMemoro).environment(\.modelContext, modelContext)) {
                        Text("Ajouter un nouveau tag")
                            .foregroundColor(.blue)
                    }
                }
//                let tag = Tag(tagName: "")
                
            }
        Button(action: {
            saveMemoro(memoro: memoro)
        }) {
            Text("Enregistrer")
        }
                
//        }
//        Button("Ajouter le memoro", action: addMemoro(memoro: memoro))
    }
    
    func saveMemoro(memoro: Memoro) {
        modelContext.insert(memoro)
        self.presentationMode.wrappedValue.dismiss()
    }
   
    
    func addTag() {
        let tag = Tag(tagName: "")
        navigationPath.append(tag)
    }
}


#Preview {
    do {
        let previewer = try Previewer()
        
        return EditMemoroView(memoro: previewer.memoro, navigationPath: .constant(NavigationPath()))
                .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}

