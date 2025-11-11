//
//  WeatherByWeekdayRow.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 10/11/25.
//

import SwiftUI

struct WeatherByWeekdayRow: View {

    // MARK: - Private Properties

    private let colombianLocale = Locale(identifier: "es-CO")

    // MARK: - Properties

    let weekdaylyDates: [WeatherDate]

    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVStack(spacing: 20) {
                ForEach(Array(weekdaylyDates.enumerated()), id: \.0) { index, weekdayDate in
                    HStack(spacing: 10) {
                        Text(
                            weekdayDate.date
                                .formatted(
                                    .dateTime
                                        .weekday(.abbreviated)
                                        .locale(colombianLocale)
                                ).capitalized
                        )
                        .font(.system(.headline, design: .rounded, weight: .semibold))

                        Spacer(minLength: 50)
                        weekdayDate.temperature.image
                            .symbolVariant(.fill)
                            .symbolRenderingMode(.multicolor)
                            .font(.title)
                        ProgressView(value: weekdayDate.temperature.percentage)
                            .progressViewStyle(.linear)
                            .tint(.blue)
                            .controlSize(.extraLarge)

                        Text("\(weekdayDate.temperature.value)º")
                            .font(.system(.headline, design: .rounded, weight: .bold))
                    }

                    if index != (weekdaylyDates.count - 1) {
                        Divider()
                            .foregroundStyle(.quinary)
                    }
                }
            }
            .padding(.top, 10)
        }
        .contentMargins(.horizontal, 20)
        .padding(.top, 5)
        .background(.thinMaterial)
    }
}

// MARK: - Previews

#Preview(
    "Weather By Weekday Row",
    traits: .sizeThatFitsLayout
) {
    WeatherByWeekdayRow(weekdaylyDates: .weekdaylyDatesTest)
        .clipShape(
            RoundedRectangle(cornerRadius: 15)
        )
        .padding()
        .background(
            LinearGradient(
                colors: [.blue, .gradientBottom],
                startPoint: .top,
                endPoint: .bottom
            )
        )
}
