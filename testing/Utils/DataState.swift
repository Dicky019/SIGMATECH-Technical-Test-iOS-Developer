//
//  DataState.swift
//  testing
//
//  Created by Dicky Darmawan on 04/09/25.
//

enum DataState<T>: Equatable {
  static func == (lhs: DataState<T>, rhs: DataState<T>) -> Bool {
    return true
  }

  case initiate
  case loading
  case empty
  case failed(error: Error)
  case success(data: T)

  var value: T? {
    if case .success(let data) = self {
      return data
    }
    return nil
  }
}

extension DataState {
  var isLoading: Bool {
    get {
      if case .loading = self {
        return true
      }
      return false
    }
    set {
      if newValue {
        self = .loading
      }
    }
  }
  
  var isSuccess: Bool {
    get {
      if case .success(_) = self {
        return true
      }
      return false
    }
  }
  
  var isEmpty: Bool {
    get {
      if case .empty = self {
        return true
      }
      
      if let items = self.value as? Array<T>, items.isEmpty {
        return true
      }
      
      return false
    }
  }
  
  func mapSuccess<U>(transform: (T) -> U) -> DataState<U> {
    switch self {
    case .initiate:
      return .initiate
    case .loading:
      return .loading
    case .empty:
      return .empty
    case .failed(let error):
      return .failed(error: error)
    case .success(let data):
      return .success(data: transform(data))
    }
  }
  
  func append<Element>(items: [Element]) -> DataState<[Element]>? where T == [Element] {
    switch self {
    case .success(let existingData):
      return .success(data: existingData + items)
    case .empty:
      return .success(data: items)
    case .initiate, .loading, .failed:
      return nil
    }
  }
  
  func onSuccess(_ action: (T) -> Void) {
    if case .success(let data) = self {
      action(data)
    }
  }
  
  func onFailed(_ action: (Error) -> Void) {
    if case .failed(let error) = self {
      action(error)
    }
  }
  
  func onLoading(_ action: (Bool) -> Void) {
    if case .loading = self {
      action(true)
    } else {
      action(false)
    }
  }
}
