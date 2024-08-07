//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Naveed on 07/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Button("Click on Button", action : { printName(name: "Naveed") })
    }
    
    func printName(name: String) {
        print("Naveed \(name)")
    }
}

#Preview {
    ContentView()
}
