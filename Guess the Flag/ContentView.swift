//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Naveed on 07/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State private var isShowingAlert = false
    var body: some View {
        VStack{
            Button {
                isShowingAlert = true
            } label: {
                Label("Edit", systemImage: "pencil")
                    .padding()
                    .foregroundStyle(.white)
                    .background(.red)
                    .containerShape(.capsule)
            }
            .alert("Important message", isPresented: $isShowingAlert) {
                Button("Delete", role: .destructive) { }
                Button("Cancel", role: .cancel) { }
                Button("Edit", role: .destructive) { }
            } message: {
                Text("Please read this")
            }
        }
        .frame(maxWidth: /*@START_MENU_TOKEN@*/.infinity/*@END_MENU_TOKEN@*/, maxHeight: .infinity)
    }
}

#Preview {
    ContentView()
}
