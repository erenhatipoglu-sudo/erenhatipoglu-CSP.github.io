import SwiftUI

struct ContentView: View {
    @State private var minute = 0
    @State private var timerRunning = false
    
 
    @State var chocolateStock = 10
    @State var gummyStock = 10
    @State var lollipopStock = 10
    @State var caramelStock = 10
    
    @State var cash = 0
    @State var soldChocolate = 0
    @State var soldGummy = 0
    @State var soldLollipop = 0
    @State var soldCaramel = 0
    
    let chocolatePrice = 3
    let gummyPrice = 2
    let lollipopPrice = 1
    let caramelPrice = 2
    
    
   
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Candy Shop Simulation")
                .font(.title)
                .bold()
            
            Text("Minute: \(minute)/60")
                .font(.title2)
            
            Button(timerRunning ? "Pause" : "Start") {
                timerRunning.toggle()
            }
            .buttonStyle(.borderedProminent)
            
            VStack(alignment: .leading) {
                Text("🍫 Chocolate: \(chocolateStock)")
                Text("🍬 Gummy: \(gummyStock)")
                Text("🍭 Lollipop: \(lollipopStock)")
                Text("🍯 Caramel: \(caramelStock)")
            }
            .font(.headline)
        }
        .padding()
        .onReceive(timer) { _ in
            if timerRunning && minute < 60 {
                minute += 1
                simulateMinute()
            }
        }
    }
    
 
    func simulateMinute() {
        // Şu anda sadece zamanı izliyor
        print("Minute \(minute): simulation running...")
        
        if minute % 2 == 0 {
            if gummyStock > 0 {
                gummyStock -= 1
                soldGummy += 1
                cash += gummyPrice
                print("Sold Gummy 🍬")
            }
        }
        
        if minute % 3 == 0 {
            if lollipopStock > 0 {
                lollipopStock -= 1
                soldLollipop += 1
                cash += lollipopPrice
                print("Sold Lollipop 🍭")
            }
        }
        if minute % 5 == 0 {
            if chocolateStock > 0 {
                chocolateStock -= 1
                soldChocolate += 1
                cash += chocolatePrice
                print("Sold Chocolate 🍫")
            } else if caramelStock > 0 {
                caramelStock -= 1
                soldCaramel += 1
                cash += caramelPrice
                print("Chocolate sold out — Sold Caramel 🍯 instead")
            }
        }
        if soldChocolate < 5 {
            print("⚠️ Restock Needed!")
            if soldLollipop < 5 {
                print("⚠️ Restock Needed!")
                if soldCaramel < 5 {
                    print("⚠️ Restock Needed!")
                    if soldGummy < 5 {
                        print("⚠️ Restock Needed!")
                    }
                    if minute == 60 {
                        print("🧾 Simulation complete!")
                        print(cash, soldChocolate, soldGummy, soldCaramel, soldLollipop)
                    }
                }
            }
            
            #Preview {
                ContentView()
            }
        }
    }
}
