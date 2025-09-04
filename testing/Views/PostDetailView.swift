//
//  PostDetailView.swift
//  testing
//
//  Created by Dicky Darmawan on 04/09/25.
//

import SwiftUI

struct PostDetailView: View {
  let post: Post
  
  var body: some View {
    ScrollView {
      VStack(alignment: .leading, spacing: 20) {
        Text(post.title)
          .font(.title)
          .fontWeight(.bold)
          .multilineTextAlignment(.leading)
        
        Divider()
        
        Text(post.body)
          .font(.body)
          .lineSpacing(4)
          .multilineTextAlignment(.leading)
        
        Spacer()
      }
      .padding()
    }
    .navigationBarTitleDisplayMode(.inline)
  }
}

#Preview {
  NavigationView {
    PostDetailView(
      post: Post(
        id: 1,
        title: "Sample Post Title",
        body: "This is a sample post body that demonstrates how the detail view will look with longer content. It includes multiple sentences to show proper text formatting."
      )
    )
  }
}
