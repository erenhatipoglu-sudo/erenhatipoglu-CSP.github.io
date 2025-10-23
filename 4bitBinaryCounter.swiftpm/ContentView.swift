import SwiftUI

struct ContentView: View {
    @State var id = 0           // current ID
    let maxID = 15              // max value for 4-bit
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Decimal: \(id)")
            HStack(spacing: 10) {
                ForEach(0..<4) { i in
                    let bit = (id >> (3 - i)) & 1
                    Rectangle()
                        .fill(bit == 1 ? Color.green : Color.gray)
                        .frame(width: 40, height: 60)
                }
            }
            
            HStack(spacing: 20) {
                Button("Enroll (+1)") {
                    id = (id == maxID) ? 0 : (id + 1)
                }
                Button("Reset (0)") {
                    id = 0
                }
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
