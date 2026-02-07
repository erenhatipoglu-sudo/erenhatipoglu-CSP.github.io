import SwiftUI

struct ContentView: View {
@State var user = ""
@State var computer = ""
@State var result = ""
@State var userScore = 0 
@State var computerScore = 0
    
 let choices = ["🪨", "📄", "✂️"]
    

    var body: some View {
        VStack(spacing:40) {
            
            Text("Taş, Kağıt, Makas")
                .font(.largeTitle)
            
            HStack(spacing:40){
            
            Text("🪨")
                .font(.title)
                .onTapGesture{
                    userChoice(uc: "🪨")
                }
            Text("📄")
                .font(.title)
                .onTapGesture{
                    userChoice(uc: "📄")
                }
            Text("✂️")
                .font(.title)
                .onTapGesture{
                    userChoice(uc: "✂️")
                }
                
        }
            Text(result)
                .font(.title)
            Text("computer: " + computer)
                .font(.title)
            Text("user Score \(userScore)")
                .font(.title)
            Text("computer Score \(computerScore)")
                .font(.title)
        }
        
        
    }
    func userChoice(uc: String){
        user = uc
        computer = randomComputerChoice()
        result = determineWinner(userChoice: user, computerChoice: computer)
    }
    
    func randomComputerChoice() -> String {
        return choices.randomElement()!
    }
    func determineWinner(userChoice: String, computerChoice: String) -> String {
        if userChoice == computerChoice{
            return "It's a tie!"
        }
        if userChoice == "🪨" && computerChoice == "📄"{
            computerScore += 1
            return "You lose!"
            
        }
        else if userChoice == "🪨" && computerChoice == "✂️"{
            userScore += 1
            return "You win!"
        }
        else if userChoice == "📄" && computerChoice == "🪨" {
            userScore += 1
            return "You win!"
        }
        else if userChoice == "📄" && computerChoice == "✂️"{
            computerScore += 1
            return "You lose!"
        }
        else if userChoice == "✂️" && computerChoice == "🪨"{
            computerScore += 1
            return "You lose!"
        }
        else {
            userScore += 1
            return "You win!"
            
        }
    }
    
    
    
}
