import SwiftUI

struct ContentView: View {
    
    @State private var time = 20
    @State private var characterX: CGFloat = 0
    @State private var characterY: CGFloat = 0
    @State private var obstacle1X: CGFloat = -150
    @State private var obstacle1Y: CGFloat = -200
    @State private var obstacle2X: CGFloat = -150
    @State private var obstacle2Y: CGFloat = -100
    @State private var obstacle3X: CGFloat = 0
    @State private var obstacle3Y: CGFloat = -300
    @State private var level = 1
    
    private let timer = Timer.publish(every: 1.0, on: .main, in: .common).autoconnect()
    private let obstacleTimer = Timer.publish(every: 0.25, on: .main, in: .common).autoconnect()
    
    var body: some View {
        VStack {
            ZStack {
                Rectangle()
                    .fill(Color.green.opacity(0.4))
                    .frame(width: 300, height: 50)
                    .offset(y: -325)
                
                // Engeller
                Rectangle()
                    .fill(Color.red)
                    .frame(width: 50, height: 20)
                    .offset(x: obstacle1X, y: obstacle1Y)
                
                if level >= 2 {
                    Rectangle()
                        .fill(Color.blue)
                        .frame(width: 40, height: 100)
                        .offset(x: -obstacle2X, y: obstacle2Y)
                }
                
                if level >= 3 {
                    Rectangle()
                        .fill(Color.black)
                        .frame(width: 150, height: 75)
                        .offset(x: obstacle3X, y: obstacle3Y)
                }
            }
            
            // Karakter
            Circle()
                .fill(Color.green)
                .frame(width: 30, height: 30)
                .offset(x: characterX, y: characterY)
            
            // Hedef
            Circle()
                .fill(Color.brown)
                .frame(width: 100, height: 100)
                .offset(y: 445)
            
            // Zaman
            Text("Time: \(time)")
                .foregroundColor(.black)
                .offset(y: 380)
            
            // Hareket tuşları
            HStack(spacing: 50) {
                Button("Sol") { moveCharacter(dx: -20, dy: 0) }
                Button("Sağ") { moveCharacter(dx: 20, dy: 0) }
                Button("Yukarı") { moveCharacter(dx: 0, dy: -20) }
                Button("Aşağı") { moveCharacter(dx: 0, dy: 20) }
            }
            .offset(y: 200)
        }
        // Engel hareketi
        .onReceive(obstacleTimer) { _ in
            updateObstacles()
            checkCollisions()
        }
        // Zaman sayacı
        .onReceive(timer) { _ in
            updateTime()
        }
    }
    
    // MARK: - Fonksiyonlar
    
    func initialTimeForLevel(level: Int) -> Int {
        switch level {
        case 1: return 20
        case 2: return 18
        case 3: return 16
        case 4: return 14
        default: return 10
        }
    }
    
    func moveCharacter(dx: CGFloat, dy: CGFloat) {
        characterX += dx
        characterY += dy
        
        // Hedefe ulaştı mı?
        if characterY <= -350 {
            nextLevel()
        }
    }
    
    func updateObstacles() {
        obstacle1X = obstacle1X < 150 ? obstacle1X + 20 : -150
        if level >= 2 { obstacle2X = obstacle2X < 150 ? obstacle2X + 20 : -150 }
        if level >= 3 { obstacle3X = obstacle3X < 150 ? obstacle3X + 20 : -150 }
    }
    
    func checkCollisions() {
        let characterFrame = CGRect(x: characterX - 15, y: characterY - 15, width: 30, height: 30)
        let obstacleFrame1 = CGRect(x: obstacle1X - 25, y: obstacle1Y - 10, width: 50, height: 20)
        let obstacleFrame2 = CGRect(x: obstacle2X - 20, y: obstacle2Y - 50, width: 40, height: 100)
        let obstacleFrame3 = CGRect(x: obstacle3X - 75, y: obstacle3Y - 37.5, width: 150, height: 75)
        
        if characterFrame.intersects(obstacleFrame1) ||
            (level >= 2 && characterFrame.intersects(obstacleFrame2)) ||
            (level >= 3 && characterFrame.intersects(obstacleFrame3)) {
            print("ÇARPTI! Resetleniyor…")
            resetLevel()
        }
    }
    
    func resetLevel() {
        characterX = 0
        characterY = 0
        obstacle1X = -150
        obstacle2X = -150
        obstacle3X = 0
        time = initialTimeForLevel(level: level)
    }
    
    func nextLevel() {
        level += 1
        print("Level Up! Şu an Level: \(level)")
        resetLevel()
    }
    
    func updateTime() {
        if time > 0 {
            time -= 1
        } else {
            print("TIME UP! Restarting level...")
            resetLevel()
        }
    }
}

