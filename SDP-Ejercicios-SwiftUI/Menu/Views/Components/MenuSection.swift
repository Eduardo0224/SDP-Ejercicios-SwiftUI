//
//  MenuSection.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 14/11/25.
//

import SwiftUI

struct MenuSection: View {

    // MARK: - Properties

    let title: String
    let items: [MenuItem]

    // MARK: - Body

    var body: some View {
        Section {
            ForEach(items) { item in
                NavigationLink(value: item.destination) {
                    MenuItemRow(item: item)
                }
                .alignmentGuide(.listRowSeparatorLeading) { dimesions in
                    dimesions[.leading]
                }
            }
        } header: {
            Text(title)
                .font(.system(.title3, design: .rounded, weight: .semibold))
                .foregroundStyle(.white)
        }
    }
}

// MARK: - Previews

#Preview {
    NavigationStack {
        List {
            MenuSection(
                title: "Exercises",
                items: [
                    MenuItem(
                        id: "music",
                        title: "Music App",
                        subtitle: "Exercise 1",
                        icon: "music.note",
                        destination: .music
                    ),
                    MenuItem(
                        id: "weather",
                        title: "Weather App",
                        subtitle: "Exercise 2",
                        icon: "cloud.sun.fill",
                        destination: .weather
                    )
                ]
            )
        }
    }
}
