//
//  ContentView.swift
//  BreakFree
//
//  Created by Eren Hatipoğlu on 21.05.2026.
//

import SwiftUI

struct HabitEntry: Identifiable {
    let id = UUID()
    var addictionName: String
    var minutes: Int
    var trigger: String
}

struct ContentView: View {
    @State private var addictionName = "Social Media"
        @State private var minutesText = ""
        @State private var selectedTrigger = "Boredom"
        @State private var entries: [HabitEntry] = []
    let addictions = ["Social Media", "Gaming", "Phone Use", "Junk Food", "Caffeine", "Other"]
      let triggers = ["Boredom", "Stress", "Friends", "Late Night", "Anxiety", "Habit"]
      
    func addEntry() {
        if let minutes = Int(minutesText), minutes > 0 {
            let newEntry = HabitEntry(
                addictionName: addictionName,
                minutes: minutes,
                trigger: selectedTrigger
            )
            
            entries.append(newEntry)
            minutesText = ""
        }
    }
    func calculateAverageMinutes() -> Int {
        var total = 0
        
        for entry in entries {
            total += entry.minutes
        }
        
        if entries.count == 0 {
            return 0
        }
        
        return total / entries.count
    }
    func riskLevel() -> String{
        let average = calculateAverageMinutes()
        
        if average < 30 {
            return "Low Risk"
        } else if average < 90 {
            return "Medium Risk"
        } else {
            return "High Risk"
        }
    }
    func deleteEntry(at offsets: IndexSet) {
        entries.remove(atOffsets: offsets)
    }
    var body: some View {
        NavigationView {
            VStack(spacing:20){
                Text("BreakFree")
                    .bold(true)
                    .font(.largeTitle)
                Form {
                    Section(header: Text("Daily Check-In")) {
                        Picker("Addiction Type", selection: $addictionName) {
                            ForEach(addictions, id: \.self) { addiction in
                                Text(addiction)
                            }
                        }
                        
                        TextField("Minutes spent today", text: $minutesText)
                            .keyboardType(.numberPad)
                        
                        Picker("Trigger", selection: $selectedTrigger) {
                            ForEach(triggers, id: \.self) { trigger in
                                Text(trigger)
                            }
                        }
                        Button("Add Entry") {
                            addEntry()
                        }
                    }
                    Section(header: Text("Progress Analysis")) {
                        Text("Average minutes: \(calculateAverageMinutes())")
                        Text("Risk level: \(riskLevel())")
                    }
                    
                    Section(header: Text("Entries")) {
                        ForEach(entries) { entry in
                            VStack(alignment: .leading) {
                                Text(entry.addictionName)
                                    .fontWeight(.bold)
                                
                                Text("\(entry.minutes) minutes • Trigger: \(entry.trigger)")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                            }
                        }
                        .onDelete(perform: deleteEntry)
                    }
                    
                    }
                }
            }
            
        }
        
    }


#Preview {
    ContentView()
}
