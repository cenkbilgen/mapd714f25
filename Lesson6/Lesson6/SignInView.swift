//
//  SignInView.swift
//  Lesson6
//
//  Created by cenk on 2025-10-08.
//


import SwiftUI

@Observable
class User {
    var isSignedIn = false
    var username = "alice"
}

struct SignInView: View {
    @Environment(User.self) var m
    @Binding var isSignedIn: Bool
    
    @State var username: String = ""
    @State var password: String = ""
    
    var body: some View {
        VStack(alignment: .leading,
               content: {
            Text("Please sign in.")
                .padding()
            
            VStack(alignment: .leading,
                   spacing: 30,
                   content: {
                TextField("Username", text: $username)
                    .padding()
                TextField("Password", text: $password)
                    .padding()
            })
            .background(Color.blue.opacity(0.1))
            .padding()
            
            Button("Login", action: {
                print("Do the login for \(username).")
                // isSignedIn = true
                m.isSignedIn = true
            })
            
            .padding()
        
        })
    }
}

#Preview {
    SignInView(isSignedIn: .constant(false))
}
