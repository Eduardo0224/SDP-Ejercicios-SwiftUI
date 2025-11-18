//
//  HeroesApp.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 16/11/25.
//

import SwiftUI

struct HeroesApp: View {

    // MARK: - Private Properties

    @StateObject private var viewModel = HeroesViewModel()

    init() {
        guard let marvelBoldFont = UIFont(name: "Marvel-Bold", size: 45),
              let marvelRegularFont = UIFont(name: "Marvel-Regular", size: 20) else {
            return
        }
        let navBarAppearance = UINavigationBarAppearance()
        navBarAppearance.largeTitleTextAttributes = [.font: marvelBoldFont]
        navBarAppearance.titleTextAttributes = [.font: marvelRegularFont]
        UINavigationBar.appearance().standardAppearance = navBarAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = navBarAppearance
        UINavigationBar.appearance().compactAppearance = navBarAppearance
    }

    // MARK: - Body

    var body: some View {
        ScrollView {
            LazyVGrid(
                columns: [
                    GridItem(.flexible(), spacing: 16),
                    GridItem(.flexible(), spacing: 16)
                ],
                spacing: 16
            ) {
                ForEach(viewModel.superHeroesOrdered) { hero in
                    NavigationLink(value: hero) {
                        HeroCardView(hero: hero)
                    }
                    .buttonStyle(.plain)
                }
            }
            .padding()
        }
        .navigationTitle("Heroes".uppercased())
        .navigationBarTitleDisplayMode(.large)
        .navigationDestination(for: SuperHero.self) { hero in
            HeroDetailView(hero: hero)
        }
        .toolbar {
            ToolbarItem {
                Button {
                    viewModel.isOrdered.toggle()
                } label: {
                    Label("", systemImage: "line.3.horizontal.decrease")
                }
                .tint(viewModel.isOrdered ? .indigo : .primary)
            }
        }
        .searchable(
            text: $viewModel.search,
            prompt: "Busca tu superheroe favorito"
        )
    }
}

// MARK: - Previews

#Preview {
    NavigationStack {
        HeroesApp()
    }
}
