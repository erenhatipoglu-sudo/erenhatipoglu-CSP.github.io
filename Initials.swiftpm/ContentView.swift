// My initials are E H
import SwiftUI


struct ContentView: View {
    let circleSize: CGFloat = 20
    let spacing: CGFloat = 5
    
    var body: some View {
        VStack(spacing: spacing) {
            ForEach(0..<10) { row in
                HStack(spacing: spacing) {
                    // Letter E
                    ForEach(0..<10) { col in
                        if isE(row: row, col: col) {
                            Circle()
                                .fill(.blue)
                                .frame(width: circleSize, height: circleSize)
                        } else {
                            // leave empty (no white background)
                            Color.clear.frame(width: circleSize, height: circleSize)
                        }
                    }
                    
                    // Space between letters
                    Spacer().frame(width: 30)
                    
                    // Letter H
                    ForEach(0..<10) { col in
                        if isH(row: row, col: col) {
                            Circle()
                                .fill(.red)
                                .frame(width: circleSize, height: circleSize)
                        } else {
                            Color.clear.frame(width: circleSize, height: circleSize)
                        }
                    }
                }
            }
        }
        .padding()
        .background(Color.black) // optional: black background for contrast
    }
    
    // E pattern
    func isE(row: Int, col: Int) -> Bool {
        col == 0 || row == 0 || row == 4 || row == 9
    }
    
    // H pattern
    func isH(row: Int, col: Int) -> Bool {
        col == 0 || col == 9 || row == 4
    }
}



