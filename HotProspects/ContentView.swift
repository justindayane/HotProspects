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
    @State private var selectedTab = "One"
    
    var body: some View {
        TabView(selection: $selectedTab) {
            VStack{
                Spacer()
                Text("Tab 1")
                Spacer()
                Button("Move to tabe 2") {
                    selectedTab = "two"
                    print(selectedTab)
                }
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 100)
                .background(.red)
                .clipShape(/*@START_MENU_TOKEN@*/Circle()/*@END_MENU_TOKEN@*/)
                Spacer()
            }
            .tabItem {
                Image(systemName: "star")
            }
            .tag("one")
            Text("tab 2")
                .tabItem {
                    Image(systemName: "plus")
                    Text("two")
                }
                .tag("two")
        }
    }
}

#Preview {
    ContentView()
}
