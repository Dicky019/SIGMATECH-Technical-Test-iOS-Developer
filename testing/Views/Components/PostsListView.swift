//
//  PostsListView.swift
//  testing
//
//  Created by Dicky Darmawan on 04/09/25.
//

import SwiftUI

struct PostsListView: View {
  let posts: [Post]
  
  var body: some View {
    List(posts) { post in
      NavigationLink(destination: PostDetailView(post: post)) {
        PostRowView(post: post)
      }
    }
    .listStyle(.plain)
  }
}

#Preview {
  NavigationView {
    PostsListView(
      posts: [
        Post(id: 1, title: "First Post", body: "This is the first post content."),
        Post(id: 2, title: "Second Post", body: "This is the second post content."),
        Post(id: 3, title: "Third Post", body: "This is the third post content.")
      ]
    )
  }
}
