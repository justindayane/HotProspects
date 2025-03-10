//
//  ContentView.swift
//  HotProspects
//
//  Created by Justin Dayane  Gbadamassi on 3/9/25.
//

import SwiftUI
import SamplePackage

/* Notes
 Notifications:
 Here we focus on Local Notification, Not Push notifications that required goign through APNS
 
 */
struct ContentView: View {
    let possibleNumbers = 1...60
    var results: String {
        let selected = possibleNumbers.random(7).sorted() // This is from the package
        let strings = selected.map(String.init)
        return strings.formatted()
    }
    
    var body: some View {
        VStack {
            Text(results)
        }
    }
    
}

#Preview {
    ContentView()
}
