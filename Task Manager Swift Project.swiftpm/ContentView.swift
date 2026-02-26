import SwiftUI

struct ContentView: View {
    @State var tasks = ["read a book", "take shower", "clean up email"]
    @State var text: String = ""
    @State var state: Int = 0
    
    
    var body: some View {
        VStack(spacing: 20) {
            Button("add task") {
                state = 1
                
            } 
            if state == 1 {
                TextField("enter task name", text: $text)
                
                Button("save") {
                    if !text.isEmpty {
                        tasks.append(text)
                        text = ""
                        state = 0
                    }
                }
            }
                VStack(spacing: 12) {
                    ForEach(tasks.indices, id: \.self) { index in
                        Text(tasks[index])
                            .onTapGesture {
                                tasks.remove(at: index)
                        
                    }
                }
            }
                .padding(.top, 200)
        }
            }
    }
        
    


