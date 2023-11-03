//
//  Post.swift
//  SocialMediaApp
//
//  Created by Andrew Higbee on 10/30/23.
//

import Foundation

struct Post: Codable, Equatable, Comparable {
    static func < (lhs: Post, rhs: Post) -> Bool {
        return lhs.date < rhs.date
    }
    
    static func ==(lhs: Post, rhs: Post) -> Bool {
        return lhs.title == rhs.title && lhs.date == rhs.date && lhs.user == rhs.user && lhs.bodyText == rhs.bodyText
    }
    
    var title: String
    var bodyText: String
    var date: Date
    var user: String
    var comments: String
    
    static let archiveURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!.appendingPathComponent("posts").appendingPathExtension("plist")
    
    static func saveToFile(posts: [Post]) {
        let propertyListEncoder = PropertyListEncoder()
        let encodedPosts = try? propertyListEncoder.encode(posts)
        try? encodedPosts?.write(to: Post.archiveURL, options: .noFileProtection)
    }
    
    static func loadFromFile() -> [Post] {
        let propertyListDecoder = PropertyListDecoder()
        if let retrievedPlayerData = try? Data(contentsOf: Post.archiveURL), let decodedPost = try? propertyListDecoder.decode(Array<Post>.self, from: retrievedPlayerData) {
            
            return decodedPost
        } else {
            return []
        }
    }
    
    static func samplePosts() -> [Post] {
        return [
        Post(title: "New ST Microcontroller", bodyText: "New 32 bit MCU provides power and customization.", date: Date(), user: "Andrew Higbee", comments: "This is pretty cool."),
        Post(title: "Quantum Computing Closer To Consumer Market", bodyText: "Quantum computers are nearing consumer markets.", date: Date(), user: "Andrew Higbee", comments: "I want one!")
        ]
    }
}
