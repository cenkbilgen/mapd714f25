//
//  Part3.swift
//  Assignment2-solution
//
//  Created by cenk on 2025-11-05.
//

import SwiftUI

struct Part3View: View {
    @Environment(SmartHomeSettings.self) var settings
    
    @State var showMessage = false
        
    var body: some View {
        @Bindable var settings = self.settings
        
        // Option 1
        if showMessage {
            Text("Preference Saved")
        }
        
        // Option 2
        Text("Preferences Saved")
            .opacity(showMessage ? 1 : 0)
        
        ToggleView(name: "Living Room Lights", isOn: $settings.lightsOn)
        
        ToggleView(name: "Heating", isOn: $settings.heatingOn)
    
        ToggleView(name: "Door", isOn: $settings.doorLocked)
        
        SummaryView()
        
        GoodNightButton()
        
        ActivityView(activities: settings.activities)
        
        Button("Save") {
            showMessage.toggle()
        }
    }
}

struct ActivityItem: Identifiable {
    let date: Date
    let description: String
    var id: Date { date }
}

struct ActivityView: View {
    let activities: [ActivityItem]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                ForEach(activities) { activity in
                    Text(activity.description)
                }
            }
        }
        .border(.red)
    }
}


#Preview {
    Part3View()
        .environment(SmartHomeSettings())
}

// -----------------------------

struct SummaryView: View {
    @Environment(SmartHomeSettings.self) var settings
    
    var body: some View {
        Text("Living Lights are \(settings.lightsOn ? "on" : "off")")
        Text("Heating \(settings.heatingOn ? "on" : "off")")
        Text("Door is \(settings.doorLocked ? "locked" : "unlocked")")
    }
}

struct GoodNightButton: View {
    @Environment(SmartHomeSettings.self) var settings
    
    var body: some View {
        Button("Good Night") {
            settings.lightsOn = false
            settings.heatingOn = true
            settings.doorLocked = true
        }
    }
}
