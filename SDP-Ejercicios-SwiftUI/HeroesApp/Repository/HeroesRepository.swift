//
//  HeroesRepository.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 16/11/25.
//

import Foundation

final class HeroesRepository: HeroesRepositoryProtocol {

    // MARK: - Functions

    func fetchHeroes() -> [SuperHero] {
        return SUPERHEROES
    }

    func fetchHero(by id: UUID) -> SuperHero? {
        return SUPERHEROES.first { $0.id == id }
    }
}
