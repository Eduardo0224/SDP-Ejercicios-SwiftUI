//
//  WeatherRespository.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 10/11/25.
//

import Foundation

protocol WeatherRespositoryProtocol {

    var hourlyDates: [WeatherDate] { get }
    var weekdaylyDates: [WeatherDate] { get }
}

// MARK: - Extension

extension WeatherRespositoryProtocol {

    // MARK: - Properties

    var hourlyDates: [WeatherDate] {
        getWeatherDates(from: .hour, in: 0...24)
    }

    var weekdaylyDates: [WeatherDate] {
        getWeatherDates(from: .day, in: 0...14)
    }

    // MARK: - Private Methods

    private func getWeatherDates(
        from component: Calendar.Component,
        in range: ClosedRange<Int>
    ) -> [WeatherDate] {
        guard let startDate = calendar.date(from: calendar.dateComponents([component], from: .now)) else {
            return []
        }

        return range.map {
            WeatherDate(date: calendar.date(byAdding: component, value: $0, to: startDate) ?? .now)
        }
    }
}
