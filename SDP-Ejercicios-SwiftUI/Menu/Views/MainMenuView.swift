//
//  MainMenuView.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 14/11/25.
//

import SwiftUI

struct MainMenuView: View {

    // MARK: - Properties

    var body: some View {
        NavigationStack {
            List {
                MenuSection(title: "Exercises", items: exercises)
                MenuSection(title: "Tasks", items: tasks)
            }
            .navigationTitle("SDP Exercises")
            .toolbarColorScheme(.light, for: .navigationBar)
            .navigationBarTitleDisplayMode(.large)
            .scrollContentBackground(.hidden)
            .background(
                LinearGradient(
                    colors: [
                        .mainMenuBackground.opacity(0.75),
                        .mainMenuBackground.opacity(0.5),
                        .white,
                    ],
                    startPoint: .top,
                    endPoint: .bottom
                )
                .ignoresSafeArea()
            )
            .navigationDestination(for: MenuDestination.self) { destination in
                switch destination {
                case .music:
                    MusicApp()
                case .weather:
                    WeatherApp()
                case .heroes:
                    PlaceholderView(title: "Heroes App", subtitle: "Coming Soon")
                }
            }
        }
    }
}

// MARK: - Previews

#Preview {
    MainMenuView()
}
