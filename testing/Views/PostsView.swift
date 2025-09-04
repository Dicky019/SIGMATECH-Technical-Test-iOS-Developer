//
//  PostsView.swift
//  testing
//
//  Created by Dicky Darmawan on 04/09/25.
//

import SwiftUI

struct PostsView: View {
  @StateObject private var viewModel = PostsViewModel()
  
  var body: some View {
    NavigationView {
      ZStack {
        contentView
      }
      .navigationTitle("Posts")
      .refreshable {
        viewModel.retry()
      }
    }
    .task {
      await viewModel.fetchPosts()
    }
  }
  
  @ViewBuilder
  private var contentView: some View {
    if viewModel.isLoading {
      LoadingStateView()
    } else if let errorMessage = viewModel.errorMessage {
      ErrorStateView(errorMessage: errorMessage) {
        viewModel.retry()
      }
    } else if viewModel.dataState.isEmpty {
      EmptyStateView {
        viewModel.retry()
      }
    } else {
      PostsListView(posts: viewModel.posts)
    }
  }
}
