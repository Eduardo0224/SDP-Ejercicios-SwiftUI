//
//  DateOption.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 10/11/25.
//

import Foundation

enum WeatherDateOption: String, CaseIterable, Identifiable {
    case today, twentyFourHours, tenDays

    // MARK: - Properties

    var id: Self { self }

    var textToShow: String {
        switch self {
        case .today: return "Hoy"
        case .twentyFourHours: return "24 h"
        case .tenDays: return "10 días"
        }
    }
}
