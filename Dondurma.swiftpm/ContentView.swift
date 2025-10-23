

import SwiftUI





struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.maxY))
        
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY))
        
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
        
        path.closeSubpath()
        
        return path
        
    }
    
}



struct ContentView: View {
    
    @State private var scoop1: Color? = nil
    
    @State private var scoop2: Color? = nil
    
    @State private var scoop3: Color? = nil
    
    @State private var scoop4: Color? = nil
    
    @State private var scoop5: Color? = nil
    
    
    
    var body: some View {
        
        VStack {
            
            
            
            ZStack(alignment: .bottom) {
                
                
                
                
                
                
                
                if let scoop1 = scoop1 {
                    
                    Circle()
                    
                        .fill(scoop1)
                    
                        .frame(width: 120, height: 120)
                    
                        .offset(y: -40)
                    
                }
                
                if let scoop2 = scoop2 {
                    
                    Circle()
                    
                        .fill(scoop2)
                    
                        .frame(width: 120, height: 120)
                    
                        .offset(y: -100)
                    
                }
                
                if let scoop3 = scoop3 {
                    
                    Circle()
                    
                        .fill(scoop3)
                    
                        .frame(width: 120, height: 120)
                    
                        .offset(y: -160)
                    
                }
                
                if let scoop4 = scoop4 {
                    
                    Circle()
                    
                        .fill(scoop4)
                    
                        .frame(width: 120, height: 120)
                    
                        .offset(y: -220)
                    
                }
                
                if let scoop5 = scoop5 {
                    
                    Circle()
                    
                        .fill(scoop5)
                    
                        .frame(width: 120, height: 120)
                    
                        .offset(y: -280)
                }
                Triangle()
                
                    .fill(.brown)
                
                    .frame(width: 120, height: 150)
                    .offset(y:75)
                
                
            }
            
            .padding(.bottom, 30)
            
            
            
            
            
            HStack {
                
                Button("Add Scoop") {
                    
                    if scoop1 == nil {
                        
                        scoop1 = .pink
                        
                    } else if scoop2 == nil {
                        
                        scoop2 = .mint
                        
                    } else if scoop3 == nil {
                        
                        scoop3 = .yellow
                        
                    } else if scoop4 == nil {
                        
                        scoop4 = .purple
                        
                    } else if scoop5 == nil {
                        
                        scoop5 = .orange
                        
                    } else {
                        
                        
                        
                        scoop1 = nil
                        
                        scoop2 = nil
                        
                        scoop3 = nil
                        
                        scoop4 = nil
                        
                        scoop5 = nil
                        
                    }
                    
                }
                
                
                
                Button("Reset") {
                    
                    
                    scoop1 = nil
                    
                    scoop2 = nil
                    
                    scoop3 = nil
                    
                    scoop4 = nil
                    
                    scoop5 = nil
                    
                }
                
            }
            
            .buttonStyle(.borderedProminent)
            
        }
        
    }
    
}



