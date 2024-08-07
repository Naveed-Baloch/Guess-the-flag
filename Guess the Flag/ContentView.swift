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
            AngularGradient(colors: [.red, .yellow, .green, .blue, .purple, .red], center: .bottom)
                .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
