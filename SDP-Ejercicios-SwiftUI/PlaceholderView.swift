//
//  PlaceholderView.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 14/11/25.
//

import SwiftUI

struct PlaceholderView: View {

    // MARK: - Properties

    let title: String
    let subtitle: String

    // MARK: - Body

    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "hammer.fill")
                .font(.system(size: 80))
                .foregroundStyle(.blue.gradient)

            Text(title)
                .font(.system(.largeTitle, design: .rounded, weight: .bold))

            Text(subtitle)
                .font(.system(.title3, design: .rounded))
                .foregroundStyle(.secondary)
        }
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
    }
}

// MARK: - Previews

#Preview {
    NavigationStack {
        PlaceholderView(title: "Heroes App", subtitle: "Coming Soon")
    }
}
