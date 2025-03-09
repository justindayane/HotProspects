//
//  ContentView.swift
//  HotProspects
//
//  Created by Justin Dayane  Gbadamassi on 3/9/25.
//

import SwiftUI

/* Notes
- In case you were tempted to mix tabView and navigationStack
 Remember that TabView has to be the parent
- Use tags to identify the tabs and improvise with their names
- Give each view a string tag and then use that for the state property
 */
struct ContentView: View {
    @State private var output = ""
    
    var body: some View {
        Text(output)
            .task {
                await fetchReadings()
            }
    }
    
    func fetchReadings() async {
        // We create a task object that will carry out the task
        let fetchTask = Task {
            let url = URL(string: "https://hws.dev/readings.json")!
            let (data, _) = try await URLSession.shared.data(from: url)
            let readings = try JSONDecoder().decode([Double].self, from: data)
            return "I found \(readings.count) readings"
        }
        
        // We then observe the result of the task performed. Could be what we returned or an error
            
        // No need to use try here because the results has th error in it as well
        let result = await fetchTask.result
        
        // Now that we have the result, we have 2 options to handle it
        
        // Option 1
//        do {
//            output = try result.get()
//        } catch {
//            output = "Error: - \(error.localizedDescription)"
//        }
        
        // Option 2
        switch result {
        case .success(let str):
            output = str
        case .failure(let failure):
            output = "Error - \(failure.localizedDescription)"
        }
    }
}

#Preview {
    ContentView()
}
