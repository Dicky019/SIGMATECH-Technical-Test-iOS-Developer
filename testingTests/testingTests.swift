//
//  testingTests.swift
//  testingTests
//
//  Created by Dicky Darmawan on 04/09/25.
//

import Testing
@testable import testing

struct testingTests {
  
  @Test func testPostServiceFetchPosts() async throws {
    let postService = PostService()
    
    let posts = try await postService.fetchPosts()
    
    #expect(!posts.isEmpty, "Posts should not be empty")
    
    let firstPost = posts.first!
    #expect(firstPost.id > 0, "Post ID should be greater than 0")
    #expect(!firstPost.title.isEmpty, "Post title should not be empty")
    #expect(!firstPost.body.isEmpty, "Post body should not be empty")
  }
  
  @Test func testPostModel() async throws {
    let post = Post(id: 1, title: "Test Title", body: "Test Body")
    
    #expect(post.id == 1)
    #expect(post.title == "Test Title")
    #expect(post.body == "Test Body")
  }
  
}
