//
//  PostsViewModel.swift
//  testing
//
//  Created by Dicky Darmawan on 04/09/25.
//

import SwiftUI

@MainActor
class PostsViewModel: ObservableObject {
  @Published var dataState: DataState<[Post]> = .initiate
  
  private let postService: PostServiceProtocol
  
  var posts: [Post] {
    return dataState.value ?? []
  }
  
  var isLoading: Bool {
    return dataState.isLoading
  }
  
  var errorMessage: String? {
    if case .failed(let error) = dataState {
      return error.localizedDescription
    }
    return nil
  }
  
  init(postService: PostServiceProtocol = PostService()) {
    self.postService = postService
  }
  
  func fetchPosts() async {
    dataState = .loading
    
    do {
      let fetchedPosts = try await postService.fetchPosts()
      if fetchedPosts.isEmpty {
        dataState = .empty
      } else {
        dataState = .success(data: fetchedPosts)
      }
    } catch {
      dataState = .failed(error: error)
    }
  }
  
  func retry() {
    Task {
      await fetchPosts()
    }
  }
}
