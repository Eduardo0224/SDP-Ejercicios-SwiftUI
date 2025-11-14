//
//  WeatherViewModel.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 10/11/25.
//

import Foundation
internal import Combine

final class WeatherViewModel: ObservableObject {

    // MARK: - Private Properties

    private let repository: WeatherRespositoryProtocol

    // MARK: - Publishers

    @Published var hourlyDates: [WeatherDate]
    @Published var weekdaylyDates: [WeatherDate]
    @Published var selectedDateOption: WeatherDateOption = .today

    // MARK: - Initializers

    init(
        repository: WeatherRespositoryProtocol = WeatherRespository()
    ) {
        self.repository = repository
        self.hourlyDates = repository.hourlyDates
        self.weekdaylyDates = repository.weekdaylyDates
    }
}
