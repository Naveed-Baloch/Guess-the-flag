//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Naveed on 07/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                LinearGradient(colors: [.red, .black], startPoint: .top, endPoint: .bottom)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
