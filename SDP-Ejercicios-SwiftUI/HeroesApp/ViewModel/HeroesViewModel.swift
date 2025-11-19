//
//  HeroesViewModel.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 16/11/25.
//

import SwiftUI
internal import Combine

final class HeroesViewModel: ObservableObject {

    // MARK: - Private Properties

    private let repository: HeroesRepositoryProtocol

    // MARK: - Published Properties

    @Published var heroes: [SuperHero] = []
    @Published var selectedHero: SuperHero?
    @Published var search = ""
    @Published var isOrdered: Bool = false

    // MARK: - Properties

    init(repository: HeroesRepositoryProtocol = HeroesRepository()) {
        self.repository = repository
        loadHeroes()
    }

    var superHeroesFiltered: [SuperHero] {
        let query = search.foldingDiacritics
        guard !query.isEmpty else {
            return heroes
        }

        return heroes.filter {
            $0.searchableText.contains(query)
        }
    }

    var superHeroesOrdered: [SuperHero] {
        if isOrdered {
            superHeroesFiltered.sorted { $0.apodo < $1.apodo }
        } else {
            superHeroesFiltered
        }
    }

    // MARK: - Functions

    func loadHeroes() {
        heroes = repository.fetchHeroes()
    }

    func selectHero(_ hero: SuperHero) {
        selectedHero = hero
    }
}
