//
//  ContentView.swift
//  HotProspects
//
//  Created by Justin Dayane  Gbadamassi on 3/9/25.
//

import SwiftUI
import UserNotifications

/* Notes
 Notifications:
 Here we focus on Local Notification, Not Push notifications that required goign through APNS
 
 */
struct ContentView: View {
    
    var body: some View {
        VStack {
            Button("Request Permission") {
                // Permission request code => First
                // Request Permission for alert, sound and badge
                UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound]) { success, error in
                    if success {
                        print("All Set!")
                    } else if let error {
                        print(error.localizedDescription)
                    }
                }
            }
            
            Button("Schedule Notification") {
                // Notification schedule + request code => Second
                // content is what should be shown
                // trigger determines when notification should be shown based on time, date or geo location
                // request combines content and trigger and also adds a UUID so you can edit it later
                // As a beginner, the easier notification to start with is the UNTimeIntervalNotification
                
                let content = UNMutableNotificationContent()
                content.title = "Feed the Kion"
                content.subtitle = "He looks hungry"
                content.sound = UNNotificationSound.default
                
                let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
                
                // chose a random identifier
                let request = UNNotificationRequest(identifier: UUID().uuidString, content: content, trigger: trigger)
                
                // Now we can add our notification request
                UNUserNotificationCenter.current().add(request)
            }
        }
    }
    
}

#Preview {
    ContentView()
}
