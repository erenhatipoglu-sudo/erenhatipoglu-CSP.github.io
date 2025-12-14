import SwiftUI

struct ContentView: View {
    @State private var robotIndex = 47
    @State private var commandIndex = 0
    @State private var timer: Timer?
    let commands = ["left", "right", "up", "down", "left", "left"]
    var body: some View {
        VStack {
            drawGrid()
            HStack{
                
                Button("run commands"){
                    run_Commands()
                }
                Button("right"){
                    move_right()
                }
                Button("left"){
                    move_left()
                }
                Button("up"){
                    move_up()
                }
                Button("down"){
                    move_down()
                }
            }
            
            
        }
        
    }
    
    func run_Commands(){
        commandIndex = 0
        
        
        
        timer?.invalidate()
        
        
        
        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
            
            
            
            if commandIndex >= commands.count {
                
                timer?.invalidate()
                
                return
                
            }
            
            
            
            let command = commands[commandIndex]
            
            if command == "right"{
                move_right()
            }
            else if command == "left"{
                move_left()
            }
            else if command == "up"{
                move_up()
            }
            else if command == "down"{
                move_down()
            }
            
            commandIndex += 1
        }
    }
    func move_right(){
        if robotIndex % 10 != 9{
            
            robotIndex += 1    
        }
    }
    func move_left(){
        if robotIndex % 10 != 0{
            
            robotIndex -= 1    
        }
    }
    func move_up(){
        if robotIndex > 9{
            
            robotIndex -= 10    
        }
    }
    func move_down(){
        if robotIndex < 90{
            
            robotIndex += 10    
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
                                .fill(.gray)
                                .frame(width: 30, height: 30)
                                .border(Color.black)
                            
                            if index == robotIndex{
                                
                                Rectangle()
                                    .fill(.red)
                                    .frame(width: 20, height: 20)
                                    .border(Color.black)
                            }
                            
                        }
                    }
                }
            }
        }
    }
    
    
}
