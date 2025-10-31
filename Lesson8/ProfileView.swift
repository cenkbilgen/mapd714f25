//
//  Untitled.swift
//  Lesson8
//
//  Created by cenk on 2025-10-30.
//

import SwiftUI
import Observation

@Observable
class User {
    let username: String
    let firstName: String
    let lastName: String
    var photoName: String?
    
    init(username: String, firstName: String, lastName: String, photoName: String?) {
        self.username = username
        self.firstName = firstName
        self.lastName = lastName
        self.photoName = nil
    }
    
    func updatePhoto(newPhotoName: String) {
        self.photoName = newPhotoName
    }
}

struct ProfileView: View {
    var u: User
    
    var body: some View {
        VStack {
            HStack {
                if let pn = u.photoName {
                    ProfilePhotoView(photoName: pn)
                } else {
                    ProfileSymbolView(symbolName: "dog")
                }
                FullnameView(firstName: u.firstName, lastName: u.lastName)
            }

            UsernameView(username: u.username)
            
            Button("Change Photo", action: {
                print("Button Pressed")
                
                print("current photo is \(u.photoName)")
                
                u.updatePhoto(newPhotoName: "profile_photo")
                
                print("current photo is \(u.photoName)")
            })
        }
        .padding()
    }
}

struct UsernameView: View {
    let username: String
    
    var body: some View {
        Text(username)
            .font(.system(size: 24).bold().italic())
    }
}


struct FullnameView: View {
    let firstName: String
    let lastName: String
    
    var body: some View {
        Text("\(lastName), \(firstName)")
    }
}

struct ProfileSymbolView: View {
    let symbolName: String
    
    var body: some View {
        Image(systemName: symbolName)
            .resizable()
            .frame(width: 100, height: 100)
    }
}

struct ProfilePhotoView: View {
    let photoName: String
    
    var body: some View {
        Image(photoName)
            .resizable()
            .aspectRatio(contentMode: .fit)
        
    }
}
