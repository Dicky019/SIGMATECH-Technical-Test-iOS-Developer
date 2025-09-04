//
//  Post.swift
//  testing
//
//  Created by Dicky Darmawan on 04/09/25.
//

struct Post: Identifiable, Decodable {
    let id: Int
    let title: String
    let body: String
}
