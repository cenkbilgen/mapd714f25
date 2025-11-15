//
//  Part2.swift
//  Assignment2-solution
//
//  Created by cenk on 2025-11-05.
//

import SwiftUI

struct Part2View: View {
    
    @State var isLightsOn = false
    @State var isHeatingOn = false
    @State var isDoorLocked = false
   
    var body: some View {
        ToggleView(name: "Living Room Lights", isOn: $isLightsOn)
        ToggleView(name: "Heating", isOn: $isHeatingOn)
        ToggleView(name: "Door", isOn: $isDoorLocked)
    }
}

#Preview {
    Part2View()
}
