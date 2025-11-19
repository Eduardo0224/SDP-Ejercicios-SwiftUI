//
//  HeroesRepositoryProtocol.swift
//  SDP-Ejercicios-SwiftUI
//
//  Created by Eduardo Andrade on 16/11/25.
//

import Foundation

protocol HeroesRepositoryProtocol {
    func fetchHeroes() -> [SuperHero]
    func fetchHero(by id: UUID) -> SuperHero?
}
