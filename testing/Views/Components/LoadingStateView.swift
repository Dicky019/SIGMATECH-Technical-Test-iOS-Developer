//
//  LoadingStateView.swift
//  testing
//
//  Created by Dicky Darmawan on 04/09/25.
//

import SwiftUI

struct LoadingStateView: View {
    let message: String
    
    init(message: String = "Loading posts...") {
        self.message = message
    }
    
    var body: some View {
        VStack {
            ProgressView()
                .scaleEffect(1.5)
            Text(message)
                .foregroundColor(.secondary)
                .padding(.top)
        }
    }
}

#Preview {
    LoadingStateView()
}