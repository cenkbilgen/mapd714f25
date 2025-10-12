//
//  FeedView.swift
//  Lesson6
//
//  Created by cenk on 2025-10-08.
//

import SwiftUI
import Observation

// MODEL

@Observable
class Post: Identifiable {
    let color: String
    let name: String
    var likes: Int
    let id = UUID()
    
    init(color: String, name: String, likes: Int) {
        self.color = color
        self.name = name
        self.likes = likes
    }
}

@Observable
class Feed {
    var posts: [Post] = [
        Post(color: "blue", name: "Rizwan", likes: 54),
        Post(color: "green", name: "Marianne", likes: 87)
    ]
}

// MODEL

struct FeedView: View {
    @State var feed = Feed()
    var body: some View {
        VStack {
            ForEach(feed.posts) { post in
                TileView(user: post.name, likes: post.likes)
                    .onTapGesture {
                        print("tap pressed")
                        post.likes += 1
                    }
            }
        }
    }
}

struct TileView: View {
    @Environment(User.self) var m
    let user: String
    let likes: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Color.green
                .frame(height: 320)
            VStack(alignment: .leading) {
                Text("posted by: \(user)")
                HStack {
                    Image(systemName: "heart.fill")
                    Text(likes.formatted())
                }
            }
            .border(user == m.username ? .green : .red)
            .padding(.horizontal)
            
        }
    }
}

#Preview {
    // TileView(user: "Rizwan", likes: 158)
    FeedView()
}
