//
//  SmartHomeSettings.swift
//  Assignment2-solution
//
//  Created by cenk on 2025-11-05.
//

import SwiftUI
import Observation

@Observable
class SmartHomeSettings {
    var lightsOn = false
    var heatingOn = false
    var doorLocked = true
    
    var activities: [ActivityItem] = []
}
