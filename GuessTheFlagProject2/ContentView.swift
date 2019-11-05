//
//  ContentView.swift
//  GuessTheFlagProject2
//
//  Created by Mati on 04/11/2019.
//  Copyright © 2019 Mati. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Russia" ,"Spain" ,"UK", "US"]
        .shuffled()
    // Para que sirve el shuffled:
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingScore = false
    @State private var scoreTitle = ""
    
    var body: some View {
        ZStack{
            Color.red.edgesIgnoringSafeArea(.all)
            VStack(spacing: 30){
                VStack {
                    Text("Tap the flag of").foregroundColor(.white)
                    Text(countries[correctAnswer]).foregroundColor(Color.white)
                }
                ForEach(0 ..< 3){ number in
                    Button(action: {
                        self.flagTapped(number)
                    }){
                        Image(self.countries[number])
                            .renderingMode(.original)
                    }
                    
                }
                Spacer()
            }
        }.alert(isPresented: $showingScore){
            Alert(title: Text(scoreTitle), message: Text("Your score is ??"), dismissButton: .default(Text("Continue")){
                
                self.askQuestion()
            })
        }
    }
    
    func flagTapped(_ number: Int) {
        if number == correctAnswer {
            scoreTitle = "Correct"
        } else {
            scoreTitle = "Wrong"
        }

        showingScore = true
    }
    
    func askQuestion(){
        countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
