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
                LinearGradient(stops : [Gradient.Stop(color: .black, location: 0.45), Gradient.Stop(color: .red, location: 0.55)], startPoint: .top, endPoint: .bottom)
            }
            .ignoresSafeArea()
        }
    }
}

#Preview {
    ContentView()
}
