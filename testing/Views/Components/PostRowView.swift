//
//  PostRowView.swift
//  testing
//
//  Created by Dicky Darmawan on 04/09/25.
//

import SwiftUI

struct PostRowView: View {
  let post: Post
  
  var body: some View {
    VStack(alignment: .leading, spacing: 8) {
      Text(post.title)
        .font(.headline)
        .lineLimit(2)
      
      Text(post.body)
        .font(.caption)
        .foregroundColor(.secondary)
        .lineLimit(3)
    }
    .padding(.vertical, 4)
  }
}

#Preview {
  PostRowView(
    post: Post(
      id: 1,
      title: "Sample Post Title",
      body: "This is a sample post body that demonstrates how the row will look with longer content."
    )
  )
  .padding()
}
