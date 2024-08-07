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
            RadialGradient(colors: [.red, .blue], center: .center, startRadius: 100, endRadius: 1000)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
