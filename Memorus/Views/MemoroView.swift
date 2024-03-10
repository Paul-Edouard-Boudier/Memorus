//
//  MemoroView.swift
//  Memorus
//
//  Created by Paul-Edouard Boudier on 28/02/2024.
//

import SwiftUI

struct MemoroView: View {
    @Environment(\.modelContext) var modelContext
    @Bindable var memoro: Memoro
//    @Binding var navigationPath: NavigationPath
    
    var body: some View {
//        Spacer()
        VStack {
                HStack {
                    Text(memoro.title)
                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                        .padding()
                        .foregroundColor(.black)
//                    Text(memoro.tag?.tagName ??  "Aucun tag pour le moment")
//                        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .trailing)
//                        .padding()
//                        .foregroundColor(.black)
                }
            Section {
                Text(memoro.body)
                    .padding()
                    .foregroundColor(Color.white)
            }
            
        }
        .frame(maxWidth: 290, maxHeight: 200)
        .background(Color.blue)
        .cornerRadius(20)
        .padding([.top, .leading, .bottom])
    }
}

//#Preview {
//    MemoroView()
//}

#Preview {
    do {
        let previewer = try Previewer()
        
//        return MemoroView(memoro: previewer.memoro, navigationPath: .constant(NavigationPath()))
//                .modelContainer(previewer.container)
        return MemoroView(memoro: previewer.memoro)
                .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
