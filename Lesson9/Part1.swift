//
//  Part1.swift
//  Assignment2-solution
//
//  Created by cenk on 2025-11-05.
//

import SwiftUI


struct Part1View: View {

    @State var isLightsOn: Bool = false
    @State var isHeatingOn: Bool = false
    @State var isDoorLocked: Bool = false
    
    var body: some View {
        Toggle("Living Room Lights", isOn: $isLightsOn)
        Toggle("Heating", isOn: $isHeatingOn)
        Toggle("Door Lock", isOn: $isDoorLocked)
        
        Text("Living Lights are \(isLightsOn ? "on" : "off")")
        Text("Heating \(isHeatingOn ? "on" : "off")")
        Text("Door is \(isDoorLocked ? "locked" : "unlocked")")
    }
}

#Preview {
    Part1View()
}
