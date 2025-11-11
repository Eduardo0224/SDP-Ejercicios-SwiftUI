//
//  WeatherByHourRow.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 10/11/25.
//

import SwiftUI

struct WeatherByHourRow: View {

    // MARK: - Properties

    let hourlyDates: [WeatherDate]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            LazyHStack(spacing: 20) {
                ForEach(hourlyDates) { hourlyDate in
                    VStack(spacing: 10) {
                        Text(hourlyDate.date.formatted(.dateTime.hour(.twoDigits(amPM: .wide))))
                            .font(
                                .system(.footnote, design: .rounded, weight: .regular)
                            )
                            .padding(.top, 10)
                        hourlyDate.temperature.image
                            .symbolVariant(.fill)
                            .symbolRenderingMode(.multicolor)
                            .font(.title)
                        Text("\(hourlyDate.temperature.value)º")
                            .font(
                                .system(.headline, design: .rounded, weight: .bold)
                            )
                    }
                }
            }
        }
        .contentMargins(.horizontal, 20)
        .padding(.vertical, 5)
        .background(.thinMaterial)
    }
}

// MARK: - Previews

#Preview(
    "Weather By Hour Row",
    traits: .fixedLayout(width: 500, height: 150)
) {
    WeatherByHourRow(hourlyDates: .hourlyDatesTest)
        .padding(.horizontal, 20)
        .background(
            LinearGradient(
                colors: [.blue, .gradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
        )
}
