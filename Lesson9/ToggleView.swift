//
//  ControlSwitch.swift
//  Assignment2-solution
//
//  Created by cenk on 2025-11-05.
//
import SwiftUI

struct ToggleView: View {
    @Environment(SmartHomeSettings.self) var settings
    let name: String
    @Binding var isOn: Bool

    var body: some View {
        Toggle(name, isOn: $isOn)
            .padding()
            .border(.primary, width: 6)
            .onChange(of: isOn) { _, newValue in
                let activity = ActivityItem(date: Date.now,
                                            description: "\(name) turned \(newValue ? "on" : "off")")
                settings.activities.append(activity)
            }
    }
}
