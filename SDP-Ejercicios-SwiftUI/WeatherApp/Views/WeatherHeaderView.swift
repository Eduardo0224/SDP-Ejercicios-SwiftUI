//
//  HeaderView.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 10/11/25.
//

import SwiftUI

struct WeatherHeaderView: View {

    // MARK: - Properties

    let title: String
    let iconName: String

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            topRoundedRectangleView
                .fill(.thinMaterial)

            Label {
                Text(title.uppercased())
            } icon: {
                Image(systemName: iconName)
            }
            .labelIconToTitleSpacing(5)
            .font(.system(.caption, design: .rounded, weight: .light))
            .foregroundStyle(.secondary)
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }
    }
}

// MARK: - Previews

#Preview(
    "Header View",
    traits: .fixedLayout(width: 500, height: 50)
) {
    WeatherHeaderView(title: "Hourly forecast", iconName: "clock")
        .padding([.top, .horizontal], 20)
        .background(
            LinearGradient(
                colors: [.blue, .gradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
        )
}
