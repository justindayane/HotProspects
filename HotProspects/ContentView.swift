//
//  ContentView.swift
//  HotProspects
//
//  Created by Justin Dayane  Gbadamassi on 3/9/25.
//

import SwiftUI

struct ContentView: View {
    let users = ["Mayoly", "May", "Richiery", "Noña", "Loca"]
    @State private var selection = Set<String>()
    
    var body: some View {
        List(users, id:\.self, selection: $selection) { user in
            Text(user)
        }
        
        if selection.isEmpty == false {
            Text("You selected \(selection.formatted())")
        }
        EditButton()
    }
}

#Preview {
    ContentView()
}
