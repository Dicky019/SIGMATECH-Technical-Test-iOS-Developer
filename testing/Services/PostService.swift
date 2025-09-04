//
//  PostService.swift
//  testing
//
//  Created by Dicky Darmawan on 04/09/25.
//

import Foundation

enum APIError: Error, LocalizedError {
  case invalidURL
  case noData
  case decodingError
  case networkError(Error)
  
  var errorDescription: String? {
    switch self {
    case .invalidURL:
      return "Invalid URL"
    case .noData:
      return "No data received"
    case .decodingError:
      return "Failed to decode data"
    case .networkError(let error):
      return "Network error: \(error.localizedDescription)"
    }
  }
}

protocol PostServiceProtocol {
  func fetchPosts() async throws -> [Post]
}

class PostService: PostServiceProtocol {
  private let baseURL = "https://jsonplaceholder.typicode.com"
  
  func fetchPosts() async throws -> [Post] {
    guard let url = URL(string: "\(baseURL)/posts") else {
      throw APIError.invalidURL
    }
    
    do {
      let (data, _) = try await URLSession.shared.data(from: url)
      
      guard !data.isEmpty else {
        throw APIError.noData
      }
      
      let posts = try JSONDecoder().decode([Post].self, from: data)
      return posts
    } catch _ as DecodingError {
      throw APIError.decodingError
    } catch {
      throw APIError.networkError(error)
    }
  }
}
