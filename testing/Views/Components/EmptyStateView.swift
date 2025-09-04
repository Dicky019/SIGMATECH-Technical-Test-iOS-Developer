//
//  EmptyStateView.swift
//  testing
//
//  Created by Dicky Darmawan on 04/09/25.
//

import SwiftUI

struct EmptyStateView: View {
  let title: String
  let message: String
  let buttonTitle: String
  let onRefresh: () -> Void
  
  init(
    title: String = "No Posts Found",
    message: String = "There are no posts available at the moment.",
    buttonTitle: String = "Refresh",
    onRefresh: @escaping () -> Void
  ) {
    self.title = title
    self.message = message
    self.buttonTitle = buttonTitle
    self.onRefresh = onRefresh
  }
  
  var body: some View {
    VStack(spacing: 16) {
      Image(systemName: "tray")
        .font(.system(size: 50))
        .foregroundColor(.gray)
      
      Text(title)
        .font(.title2)
        .fontWeight(.semibold)
      
      Text(message)
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
        .padding(.horizontal)
      
      Button(buttonTitle) {
        onRefresh()
      }
      .buttonStyle(.borderedProminent)
    }
  }
}

#Preview {
  EmptyStateView(onRefresh: { print("Refresh tapped") })
}
