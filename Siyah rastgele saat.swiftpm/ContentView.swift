import SwiftUI

     

struct ContentView: View {
  @State private var hour = 3
    
    var body: some View {
VStack{
    
    ZStack {
        
        
        Circle()
            .foregroundColor(.black)
            .frame(width:200, height: 200)
            .onTapGesture {
                hour = (hour % 12) + 1
            }
        
        ForEach(1...12, id: \.self) { number in
            let step = 2 * Double.pi / 12
            let angle = Double(number) * step - Double.pi/2
            let radius = 80.0
            let dx = cos(angle) * radius
            let dy = sin(angle) * radius
            
            
            Text("\(number)")
                .position(x: 100 + dx, y: 100 + dy) 
                .foregroundColor(.white)
                .frame(width: 200, height: 200)
            
}
        Rectangle() 
            .fill(Color.blue)
            .frame(width:2, height: 50)
            .offset(y: -25)
            .rotationEffect(.degrees(Double(hour) * 30 - 90))
        
        }
    Button("Rastgele Saat") {
        
        
        hour = Int.random(in: 1...12)
        
    }
    
    
    
    
}
    
    }
    }


