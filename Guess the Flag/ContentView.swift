//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Naveed on 07/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Button("Login", role: .destructive,action: {})
                .buttonStyle(.bordered)
            
            Button("Logout",role: .destructive, action: {})
                .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    ContentView()
}
