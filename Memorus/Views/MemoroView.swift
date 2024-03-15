//
//  MemoroView.swift
//  Memorus
//
//  Created by Paul-Edouard Boudier on 28/02/2024.
//

import SwiftUI

struct MemoroView: View {
    @Environment(\.modelContext) var modelContext
    @State private var path = NavigationPath()
    @Bindable var memoro: Memoro
    
    var body: some View {
        NavigationLink(destination: EditMemoroView(memoro: memoro, navigationPath: $path)) {
            VStack {
                    HStack {
                        Text(memoro.title)
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, alignment: .leading)
                            .padding()
                            .foregroundColor(.black)
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
}


#Preview {
    do {
        let previewer = try Previewer()
        return MemoroView(memoro: previewer.memoro)
                .modelContainer(previewer.container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
