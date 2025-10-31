//
//  Lesson7App.swift
//  Lesson7
//
//  Created by cenk on 2025-10-15.
//

import SwiftUI

@main
struct Lesson7App: App {
    @State var user100 = User(username: "captain",
                              firstName: "Mike",
                              lastName: "Gretzky", photoName: "profile-photo")
    
    @State var user200 = User(username: "mary", firstName: "mary", lastName: "jackson", photoName: nil)
    
    var body: some Scene {
        WindowGroup {
            ProfileView(u: user100)
        }
    }
}
