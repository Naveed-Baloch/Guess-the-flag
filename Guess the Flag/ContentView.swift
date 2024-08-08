//
//  ContentView.swift
//  Guess the Flag
//
//  Created by Naveed on 07/08/2024.
//

import SwiftUI

struct ContentView: View {
    @State var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"]
    
    @State var correctCountryIndex = Int.random(in: 0...2)
    @State var guessedCountryIndex = -1
    @State private var showResult = false
    @State private var dialogMessage = ""
    var body: some View {
        ZStack {
            RadialGradient(stops: [
                .init(color: Color(red: 0.1, green: 0.2, blue: 0.45), location: 0.3),
                .init(color: Color(red: 0.76, green: 0.15, blue: 0.26), location: 0.3),
            ], center: .top, startRadius: 200, endRadius: 400)
                .ignoresSafeArea()
            
            VStack{
                Spacer()
                Text("Guess the Flag")
                    .textCase(.uppercase)
                    .font(.title.weight(.bold))
                    .foregroundStyle(.white)
     
                VStack(spacing: 15) {
                    VStack {
                        Text("Tap the flag of")
                            .font(.subheadline.weight(.heavy))
                            .foregroundStyle(.white)
                        Text(countries[correctCountryIndex])
                            .font(.largeTitle.weight(.semibold))
                            .foregroundStyle(.white)
                    }
                    
                    ForEach(0..<3) { number in
                        Button {
                            guessedCountryIndex = number
                            checkAnswer()
                        } label: {
                            Image(countries[number])
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 5)
                        }
                    }
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 20)
                .background(.ultraThinMaterial)
                .clipShape(.rect(cornerRadius: 15))
                Spacer()
            }
            .padding(.horizontal, 25)
        }
        .alert(dialogMessage,isPresented: $showResult){
            Button("Next", action: askQuestion)
            if guessedCountryIndex != correctCountryIndex {
                Button("Retry", action: { showResult = false })
            }
        }
    }
    
    func askQuestion() {
        countries.shuffle()
        correctCountryIndex = Int.random(in: 0...2)
    }
    
    func checkAnswer() {
        if guessedCountryIndex == correctCountryIndex {
            dialogMessage = "Correct Answer Nice Work"
        } else {
            dialogMessage = "In correct answer"
        }
        showResult = true
    }
}

#Preview {
    ContentView()
}
