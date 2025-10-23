import SwiftUI

struct ContentView: View {
    var body: some View {
         ZStack {
            
             
             
             
             
             Capsule()
                 .frame(width:125, height:100)
                 .offset(y:-125)
                 .offset(x:-40)
                 .foregroundStyle(Color.black)
             Capsule()
                 .frame(width:125, height:100)
                 .offset(y:-125)
                 .offset(x:40)
                 .foregroundStyle(Color.black)
             
             
             
             
             Capsule()
                 .frame(width: 200, height:250)
                 .foregroundStyle(Color.brown)
             Rectangle()
                 .frame(width: 80, height: 165)
                 .offset(y:175)
                 .foregroundStyle(Color.brown)
             Rectangle()
                 .frame(width:300, height:250)
                 .offset(y:350)
                 .foregroundStyle(Color.blue)
             Capsule()
                 .frame(width: 25, height:30)
                 .foregroundStyle(Color.black)
                 .offset(y:-25)
                 .offset(x:-39)
             Capsule()
                 .frame(width: 25, height:30)
                 .foregroundStyle(Color.black)
                 .offset(y:-25)
                 .offset(x:39)
         }
        }
}

