//
//  ContentView.swift
//  Multiplication Table for Kids
//
//  Created by Akhmed on 11.09.23.
//

import SwiftUI

struct ContentView: View {
    @State private var selectedTable = 2
    @State private var numberOfQuestions = 5
    @State private var isGameStarted = false
    @State private var currentQuestion = 0
    @State private var question = ""
    @State private var answer = ""
    @State private var userAnswer = ""
    @State private var isCorrect = false
    @State private var correctCount = 0
    @State private var incorrectCount = 0

    var body: some View {
        ZStack {
            RadialGradient(gradient: Gradient(colors: [.yellow, .cyan]), center: .topLeading, startRadius: 5, endRadius: 600)
                .edgesIgnoringSafeArea(.all)
            VStack {
                Spacer()
                if !isGameStarted {
                    Text("Выберите таблицу:")
                        .font(.largeTitle)
                        .bold()
                        .foregroundColor(.black)
                        .padding()
                    Spacer()
                    Stepper(value: $selectedTable, in: 2...12) {
                        Text("Таблица: \(selectedTable)")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    .padding()
                    
                    Text("Выберите количество вопросов:")
                        .font(.title)
                        .foregroundColor(.black)
                        .padding()
                    
                    Picker("Количество вопросов", selection: $numberOfQuestions) {
                        Text("5").tag(5)
                        Text("10").tag(10)
                        Text("20").tag(20)
                    }
                    .pickerStyle(.segmented)
                    .font(.title)
                    .padding()
                    
                    Button(action: startGame) {
                        Text("Старт")
                            .customStyle()
                        
                    }
                } else {
                    VStack {
                        Text("Таблица умножения: \(selectedTable)")
                            .font(.title)
                            .foregroundColor(.black)
                            .padding()
//                            .underline(true, color: .black)
                        
                        
                        Text(question)
                            .font(.title)
                            .padding()
                        
                        TextField("Введите ответ", text: $userAnswer)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .padding()
                        Button(action: checkAnswer) {
                            Image(systemName: "pencil.line")
                                .font(.system(size: 50))
                                .foregroundColor(.primary)
                                .padding(20)
                                .background(.regularMaterial)
                                .clipShape(RoundedRectangle(cornerRadius: 20))
                                
                                
                                
                        }
                        
                        if currentQuestion == numberOfQuestions {
                            Text("Игра окончена!")
                                .font(.title)
                                .padding()
                            
                            Text("✅ \(correctCount)")
                                .font(.title)
                                .padding()
                            
                            Text("❌ \(incorrectCount)")
                                .font(.title)
                                .padding()
                            
                            Button(action: restartGame) {
                                Text("Играть снова")
                                    .customStyle()
                                    
                            }
                        }
                    }
                    .onAppear(perform: askQuestion)
                    .foregroundColor(.black)
                    Spacer()
                    Button(action: goBack) {
                        Text("Назад")
                            .font(.title)
                            .padding()
                            .foregroundColor(.black)
                    }
                }
            }
        }
    }

    func startGame() {
        currentQuestion = 0
        isGameStarted = true
        askQuestion()
    }

    func askQuestion() {
        if currentQuestion < numberOfQuestions {
            let num2 = Int.random(in: 1...12)
            question = "Сколько будет \(selectedTable) x \(num2)?"
            answer = "\(selectedTable * num2)"
            userAnswer = ""
            isCorrect = false
        }
    }

    func checkAnswer() {
        if userAnswer == answer {
            isCorrect = true
            correctCount += 1
        } else {
            isCorrect = false
            incorrectCount += 1
        }
        
        currentQuestion += 1
        askQuestion()
    }

    func goBack() {
        isGameStarted = false
        currentQuestion = 0
        correctCount = 0
        incorrectCount = 0
        userAnswer = ""
    }

    func restartGame() {
        goBack()
        startGame()
    }
}






































struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
