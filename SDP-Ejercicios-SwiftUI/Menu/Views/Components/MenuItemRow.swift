//
//  MenuItemRow.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 14/11/25.
//

import SwiftUI

struct MenuItemRow: View {

    // MARK: - Properties

    let item: MenuItem

    // MARK: - Body

    var body: some View {
        HStack(spacing: 16) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(
                        LinearGradient(
                            colors: [
                                .mainMenuBackground.opacity(0.85),
                                .mainMenuBackground.opacity(0.65)
                            ],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        )
                    )
                    .frame(width: 56, height: 56)
                    .shadow(color: .mainMenuBackground.opacity(0.25), radius: 7, x: 0, y: 3)

                Image(systemName: item.icon)
                    .font(.system(size: 24, weight: .semibold))
                    .foregroundStyle(.white)
                    .symbolRenderingMode(.hierarchical)
            }

            VStack(alignment: .leading, spacing: 4) {
                Text(item.title)
                    .font(.system(.headline, design: .rounded, weight: .semibold))
                    .foregroundStyle(.primary)

                Text(item.subtitle)
                    .font(.system(.subheadline, design: .rounded))
                    .foregroundStyle(.secondary)
            }

            Spacer()
        }
        .padding(.vertical, 8)
    }
}

// MARK: - Previews

#Preview(
    "Menu Item Row",
    traits: .sizeThatFitsLayout
) {
    MenuItemRow(
        item: MenuItem(
            id: "weather",
            title: "Weather App",
            subtitle: "Exercise 2",
            icon: "cloud.sun.fill",
            destination: .weather
        )
    )
    .padding()
}
