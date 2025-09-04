//
//  ErrorStateView.swift
//  testing
//
//  Created by Dicky Darmawan on 04/09/25.
//

import SwiftUI

struct ErrorStateView: View {
  let errorMessage: String
  let onRetry: () -> Void
  
  var body: some View {
    VStack(spacing: 16) {
      Image(systemName: "exclamationmark.triangle")
        .font(.system(size: 50))
        .foregroundColor(.orange)
      
      Text("Error")
        .font(.title2)
        .fontWeight(.semibold)
      
      Text(errorMessage)
        .foregroundColor(.secondary)
        .multilineTextAlignment(.center)
        .padding(.horizontal)
      
      Button("Retry") {
        onRetry()
      }
      .buttonStyle(.borderedProminent)
    }
  }
}

#Preview {
  ErrorStateView(
    errorMessage: "Failed to load posts. Please check your internet connection.",
    onRetry: { print("Retry tapped") }
  )
}
