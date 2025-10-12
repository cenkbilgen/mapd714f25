//
//  Lesson6App.swift
//  Lesson6
//
//  Created by cenk on 2025-10-08.
//

import SwiftUI

//@Observable
//class User {
//    var isSignedIn: Bool = false
//}

@main
struct Lesson6App: App {
    @State var isSignedIn: Bool = false
    
    @State var me = User()
    
    var body: some Scene {
        WindowGroup {
            if isSignedIn {
                FeedView()
            } else {
                SignInView(isSignedIn: $isSignedIn)
            }
        }
        .environment(me)
    }
}
