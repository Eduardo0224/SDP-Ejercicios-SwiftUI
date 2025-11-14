//
//  WeatherApp.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 8/11/25.
//

import SwiftUI

struct WeatherApp: View {

    // MARK: - Private Properties

    private var footerView: some View {
        bottomRoundedRectangleView
            .fill(.thinMaterial)
            .frame(height: 20)
            .padding(.bottom, 20)
    }

    // MARK: - ObservedObjects

    @ObservedObject private var viewModel = WeatherViewModel()

    // MARK: - Properties

    var body: some View {
        ScrollView(showsIndicators: false) {
            Text("Bogotá")
                .font(.system(.largeTitle, design: .rounded, weight: .bold))

            Picker("selectedDateOption", selection: $viewModel.selectedDateOption) {
                ForEach(WeatherDateOption.allCases) { dateOption in
                    Text(dateOption.textToShow)
                }
            }
            .foregroundStyle(.thinMaterial)
            .pickerStyle(.segmented)

            .frame(width: 180)
            .padding(.bottom)

            VStack(alignment: .leading) {
                HStack {
                    Text("22º")
                        .font(.system(size: 84, weight: .bold, design: .rounded))
                    Spacer()
                    Image(systemName: "cloud.sun")
                        .symbolVariant(.fill)
                        .font(.system(size: 80))
                        .symbolRenderingMode(.multicolor)
                }
                Text("Parcialmente nublado")
                    .font(.system(.title, design: .rounded, weight: .bold))
                Text("Max 28º . Min 17º")
                    .font(.system(.headline, design: .rounded, weight: .regular))
                    .foregroundStyle(.secondary)
            }
            .padding(30)
            .background(
                RoundedRectangle(cornerRadius: 15)
                    .fill(.thinMaterial)
            )
            .padding(.bottom, 15)

            LazyVStack(
                spacing: 0,
                pinnedViews: .sectionHeaders
            ) {
                Section {
                    WeatherByHourRow(hourlyDates: viewModel.hourlyDates)
                } header: {
                    WeatherHeaderView(title: "Prónostico por hora", iconName: "clock")
                } footer: {
                    footerView
                }

                Section {
                    WeatherByWeekdayRow(weekdaylyDates: viewModel.weekdaylyDates)
                } header: {
                    WeatherHeaderView(title: "Previsión para 15 días", iconName: "calendar")
                } footer: {
                    footerView
                }
            }
        }
        .clipShape(
            topRoundedRectangleView
        )
        .edgesIgnoringSafeArea(.bottom)
        .padding(.horizontal, 20)
        .background(
            LinearGradient(
                colors: [.blue, .gradientBottom],
                startPoint: UnitPoint.top,
                endPoint: .bottom
            )
        )
        .navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .principal) {
                Text("Tiempo")
                    .font(.system(.title2, design: .rounded))
                    .foregroundColor(.white)
            }
        }
    }
}

var topRoundedRectangleView: some Shape {
    UnevenRoundedRectangle(
        topLeadingRadius: 15,
        topTrailingRadius: 15
    )
}

var bottomRoundedRectangleView: some Shape {
    UnevenRoundedRectangle(
        bottomLeadingRadius: 15,
        bottomTrailingRadius: 15
    )
}

// MARK: - Previews

#Preview {
    NavigationStack {
        WeatherApp()
    }
}
