//
//  Assignment2_solutionApp.swift
//  Assignment2-solution
//
//  Created by cenk on 2025-11-05.
//

import SwiftUI

@main
struct Assignment2_solutionApp: App {
    
    @State var settings = SmartHomeSettings()
    
    var body: some Scene {
        WindowGroup {
            Part3View()
                .environment(settings)
        }
    }
}
