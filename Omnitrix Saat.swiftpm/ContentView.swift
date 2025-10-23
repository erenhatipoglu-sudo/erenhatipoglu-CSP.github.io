import SwiftUI

struct ContentView: View {
    @State private var hour = 12
    @State private var minute = 0
    @State private var uzayli: String = "Ben 10"
    
    let uzaylilar = [
        "Four Arms", "Heatblast", "Diamondhead", "XLR8",
        "Ghostfreak", "Upgrade", "Wildmutt", "Ripjaws",
        "Stinkfly", "Cannonbolt", "Wildvine", "Ditto"
    ]
    
    var body: some View {
        VStack {
            ZStack {
                
                Circle()
                    .foregroundColor(.green)
                    .frame(width: 200, height: 200)
                    .contentShape(Circle()) 
                    .onTapGesture {
                        
                        minute += 15
                        if minute == 60 {
                            minute = 0
                            hour = (hour % 12) + 1
                            
                            
                            uzayli = uzaylilar[(hour - 1) % uzaylilar.count]
                        }
                    }
                
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 4, height: 50)
                    .offset(y: -25)
                    .rotationEffect(.degrees(Double(hour % 12) * 30 + Double(minute) * 0.5)) //bunu yapay zekaya hesaplattırdım.   
                
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 3, height: 70)
                    .offset(y: -35)
                    .rotationEffect(.degrees(Double(minute) * 6))
            }
            
            
            Text("\(hour):\( minute)")
                .font(.largeTitle)
                .padding(.top, 20)
            
            
            Text("Uzaylı: \(uzayli)")
                .font(.title2)
                .padding(.top, 10)
        }
        .padding()
        
        Rectangle()
            .fill(Color.red)
            .frame(width: 150, height:50)
            .onTapGesture {
                
                minute -= 15
                if minute < 0 {
                    minute = 45
                    hour = (hour % 12) - 1
                
                        }
                           
                    
                }
            }               
    }    
