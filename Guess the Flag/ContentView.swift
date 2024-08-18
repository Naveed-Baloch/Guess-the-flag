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
    
    @State private var dialogMessage = ""

    private let totalLevels = 3
    @State private var currentLevel = 1
    @State private var score = 0
    @State private var showGameResult = false
    @State private var showRoundResult = false
    @State private var rotationAngle = 0.0
    @State private var selectedFlagScale = 1.0
    @State private var opacityOfNonSelectedFlags = 1.0
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
                        
                        Text("Round \(currentLevel)/\(totalLevels)")
                            .font(.subheadline.weight(.semibold))
                            .foregroundStyle(.white)
                    }
                    
                    ForEach(0..<3) { number in
                        let animateFlag = guessedCountryIndex == number
                        Button {
                            guessedCountryIndex = number
                            withAnimation {
                                rotationAngle = 180.0
                                selectedFlagScale = 1.2
                                opacityOfNonSelectedFlags = 0.25
                            }
                            // Wait for the animation to complete then check the result
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                                rotationAngle = 0.0
                                withAnimation{
                                    selectedFlagScale = 1.0
                                }
                                checkAnswer()
                            })
                            
                            
                        } label: {
                            Image(countries[number])
                                .clipShape(.rect(cornerRadius: 10))
                                .shadow(radius: 5)
                                .opacity(guessedCountryIndex != -1 && !animateFlag ? opacityOfNonSelectedFlags : 1)
                                .rotation3DEffect(
                                    .degrees(animateFlag ? rotationAngle : 0.0), axis: (x: 1.0, y: 0.0, z: 0.0)
                                )
                                .scaleEffect(animateFlag ? selectedFlagScale : 1.0)
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
        .alert(dialogMessage,isPresented: $showRoundResult) {
            if currentLevel == totalLevels {
                Button("Check Result", action: {
                    showGameResult = true
                })
            } else {
                Button("Next", action: askQuestion)
                if guessedCountryIndex != correctCountryIndex {
                    Button("Retry", action: { showRoundResult = false })
                }
            }
        }
        .alert("Game Result",isPresented: $showGameResult){
            Button("Reset Game") {
                currentLevel = 0
                score = 0
                askQuestion()
            }
        } message: {
            Text("Score: \(score)/\(totalLevels)")
        }
    }
    
    func askQuestion() {
        currentLevel += 1
        countries.shuffle()
        opacityOfNonSelectedFlags = 1.0
        correctCountryIndex = Int.random(in: 0...2)
    }
    
    func checkAnswer() {
        if guessedCountryIndex == correctCountryIndex {
            score += 1
            dialogMessage = "Correct Answer Nice Work"
        } else {
            dialogMessage = "In correct answer"
        }
        showRoundResult = true
    }
}

#Preview {
    ContentView()
}
