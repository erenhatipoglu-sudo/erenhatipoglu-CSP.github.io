import SwiftUI

struct ContentView: View {
var music = ["rap", "rock", "clasic","pop"]
    var body: some View {
        VStack {
            Rectangle()
                .fill(Color.red)               // inside color
                .frame(width: 150, height: 50) 
                .offset(x:0,y:-200)
            Text(music[0])
                .offset(y:-240)
            Rectangle()
                .fill(Color.blue)               // inside color
                .frame(width: 150, height: 50) 
                .offset(x:0,y:-200)
            Text(music[1])
                .offset(y:-240)
            Rectangle()
                .fill(Color.green)               // inside color
                .frame(width: 150, height: 50) 
                .offset(x:0,y:-200)
            Text(music[2])
                .offset(y:-240)
            Rectangle()
                .fill(Color.purple)               // inside color
                .frame(width: 150, height: 50) 
                .offset(x:0,y:-200)
            Text(music[3])
                .offset(y:-240)
                
            
        }
    }
}
