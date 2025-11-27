import SwiftUI

struct ContentView: View {
    @State private var colors = Array(repeating: Color.gray, count: 100)
    @State private var userInput = ""
    @State private var message = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            // --- GRID ---
            VStack(spacing: 2) {
                ForEach(0..<10) { row in
                    HStack(spacing: 2) {
                        ForEach(0..<10) { col in
                            let index = row * 10 + col
                            
                            Rectangle()
                                .fill(colors[index])
                                .frame(width: 30, height: 30)
                                .border(Color.black)
                        }
                    }
                }
            }
            
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
            
            Spacer()
        }
        .padding()
    }
    
    // --- FUNCTION: CHANGE COLOR ---
    func changeColor() {
        if let num = Int(userInput), num >= 0 && num < 100 {
            colors[num] = .blue    // change cell color
            message = ""
        } else {
            message = "Invalid input"
        }
    }
}

