//
//  HourlyDate.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 10/11/25.
//

import SwiftUI

/// Global current calendar
let calendar = Calendar.current

struct WeatherDate: Identifiable {

    // MARK: - Properties

    let id = UUID()
    let date: Date
    let temperature = Temperature()

    struct Temperature {

        // MARK: - Static Properties

        static let minValue = -10
        static let maxValue = 30
        static let range: ClosedRange<Int> =  (-10...30)

        // MARK: - Properties

        let value: Int

        var percentage: Double {
            let minValue = Self.minValue
            let maxValue = Self.maxValue
            return (Double(value) - Double(minValue)) / Double(maxValue - minValue)
        }

        var image: Image {
            switch value {
            case -10..<(-5):
                Image(systemName: "cloud.snow")
            case -5..<0:
                Image(systemName: "cloud.moon.rain")
            case 0..<5:
                Image(systemName: "cloud.moon")
            case 5..<10:
                Image(systemName: "cloud.rain")
            case 10..<15:
                Image(systemName: "cloud.bolt")
            case 15..<20:
                Image(systemName: "cloud.sun.rain")
            case 20..<25:
                Image(systemName: "cloud.sun")
            case 25..<30:
                Image(systemName: "cloud")
            default:
                Image(systemName: "cloud")
            }
        }

        // MARK: - Initializers

        init(value: Int = Int.random(in: range)) {
            self.value = value
        }
    }
}

// MARK: - Extensions

extension Collection where Element == WeatherDate {

    static var hourlyDatesTest: [Element] {
        (0...24).map {
            Element(date: calendar.date(byAdding: .hour, value: $0, to: .now) ?? .now)
        }
    }

    static var weekdaylyDatesTest: [Element] {
        (0..<15).map {
            Element(date: calendar.date(byAdding: .day, value: $0, to: .now) ?? .now)
        }
    }
}
