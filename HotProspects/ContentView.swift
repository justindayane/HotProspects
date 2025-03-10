//
//  ContentView.swift
//  HotProspects
//
//  Created by Justin Dayane  Gbadamassi on 3/9/25.
//

import SwiftUI

/* Notes
 
 */
struct ContentView: View {
    @State private var backgroundColor = Color.blue
    @State private var messages = 0
    let people = ["Mayoly Santana", "Rami Arias", "Masiel Alvarez", "Oliver Munoz"]
    
    var body: some View {
        NavigationStack {
            List (people, id:\.self) { person in
                Text(person)
                    .swipeActions {
                        Button("Send Message", systemImage: "paperplane") {
                            print("You just sent a message to \(person)")
                            messages += 1
                        }
                        .tint(.blue)
                    }
                    .swipeActions {
                        Button("Delete", systemImage: "trash", role: .destructive) {
                            print("You just deleted \(person)")
                        }
                    }
                    .swipeActions(edge: .leading) {
                        Button("Pin", systemImage: "pin") {
                            print("You just pinned \(person)")
                        }
                        .tint(.orange)
                    }
                
            }
            .toolbar {
                Button("Add", systemImage: "person.circle") {
                    
                }
            }
            
            
            Text("\(messages) messages sent so far")
                
        }
    }
    
}

#Preview {
    ContentView()
}
