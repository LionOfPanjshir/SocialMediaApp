//
//  PostController.swift
//  SocialMediaApp
//
//  Created by Andrew Higbee on 10/31/23.
//

import Foundation

class PostController {
    static let shared = PostController()
    
    var posts: [Post] = []
    
    func loadInitialPosts() {
        if Post.loadFromFile().isEmpty {
            posts = Post.samplePosts()
        } else {
            posts = Post.loadFromFile()
        }
    }
    
    func addPost(_ post: Post) {
        posts.append(post)
        Post.saveToFile(posts: posts)
    }
    
    func update(_ post: Post, index: Int) {
        posts[index] = post
        Post.saveToFile(posts: posts)
    }
    
    func remove(at index: Int) {
        posts.remove(at: index)
        Post.saveToFile(posts: posts)
    }
}
