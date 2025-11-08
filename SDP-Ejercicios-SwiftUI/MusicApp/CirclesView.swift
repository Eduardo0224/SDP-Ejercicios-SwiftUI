//
//  CirclesView.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 4/11/25.
//

import SwiftUI

struct CirclesView: View {

    // MARK: - Private Properties

    private let maxRadius: CGFloat = 190
    private let colors: [Color] = [.outterCircle, .innerCircle, .accent]

    // MARK: - Properties

    var body: some View {
        ZStack {
            ForEach(0..<3) { index in
                let radius = maxRadius - CGFloat(index) * 50
                let opacity = 0.7 * Double(radius / maxRadius)
                let topMostIndex = index == 2
                let currentColor = colors[index]
                Circle()
                    .fill(currentColor)
                    .frame(width: radius * 1.5, height: radius * 1.5)
                    .opacity(topMostIndex ? 1.0 : opacity)
                    .shadow(color: currentColor, radius: topMostIndex ? 0 : 5)
                    .overlay(
                        topMostIndex ?
                        Image(systemName: "music.note.list")
                            .font(.system(size: 70))
                            .foregroundStyle(.bottom)
                        : nil
                    )
            }
        }
    }
}

// MARK: - Previews

#Preview(
    "Circles View",
    traits: .sizeThatFitsLayout
) {
    CirclesView()
}
