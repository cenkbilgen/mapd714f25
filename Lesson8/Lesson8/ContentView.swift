//
//  ContentView.swift
//  Lesson8
//
//  Created by cenk on 2025-10-30.
//

import SwiftUI

struct ContentView: View {
    
    var user100 = User(username: "garfield", firstName: "George", lastName: "Washington", photoName: nil)
    
    var body: some View {
        TabView {
            // 1. Feed Tab
            // FeedView()
           Text("This is the feed")
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Feed")
                }
            
            // 2. Post Tab
//            PostView()
            Text("This is for posting")
                .tabItem {
                    Image(systemName: "plus.circle.fill")
                    Text("Post")
                }
            
            // 3. Profile Tab
            ProfileView(u: user100)
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Profile")
                }
        }
    }
}


#Preview {
    ContentView()
}
