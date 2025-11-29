import SwiftUI

struct ContentView: View {
    @State private var chosenColor = Color.blue
    @State private var colors = Array(repeating: Color.gray, count: 100)
    @State private var userInput = ""
    @State private var message = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            // --- GRID ---
            VStack(spacing: 2) {
                drawGrid()
                
                // --- INPUT FIELD ---
                HStack {
                    TextField("Type a number (0–99)", text: $userInput)
                        .keyboardType(.numberPad)
                        .frame(width: 150)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    
                    Button("Paint") {
                        changeColor()
                    }
                }
                
                Text(message)
                    .foregroundStyle(.red)
                    .bold()
                HStack{
                    Rectangle()
                        .fill(.black)
                        .frame(width: 30, height: 30)
                        .border(Color.black)
                        .onTapGesture{
                            chosenColor = .black
                        }
                    Rectangle()
                        .fill(.white)
                        .frame(width: 30, height: 30)
                        .border(Color.black)
                        .onTapGesture{
                            chosenColor = .white
                        }
                    Rectangle()
                        .fill(.red)
                        .frame(width: 30, height: 30)
                        .border(Color.black)
                        .onTapGesture{
                            chosenColor = .red
                        }
                    Rectangle()
                        .fill(.blue)
                        .frame(width: 30, height: 30)
                        .border(Color.black)
                        .onTapGesture{
                            chosenColor = .blue
                        }
                    Rectangle()
                        .fill(.green)
                        .frame(width: 30, height: 30)
                        .border(Color.black)
                        .onTapGesture{
                            chosenColor = .green
                        }
                }
                Spacer()
            }
            .padding()
        }
        
    }
        func changeColor() {
            if let num = Int(userInput), num >= 0 && num < 100 {
                colors[num] = chosenColor    // change cell color
                message = ""
            } else {
                message = "Invalid input"
            }
        } 
    func drawGrid()-> some View{
        VStack(spacing: 2) {
            ForEach(0..<10) { row in
                HStack(spacing: 2) {
                    ForEach(0..<10) { col in
                        let index = row * 10 + col
                        
                        ZStack{
                            Rectangle()
                                .fill(colors[index])
                                .frame(width: 30, height: 30)
                                .border(Color.black)
                            Text(String(index))
                                .font(.title2)
                                .foregroundColor(.white)
                        }
                    }
                }
            }
        }
    }
    }
